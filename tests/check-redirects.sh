#!/usr/bin/env bash
# check-redirects.sh
#
# Verifies that for each domain listed in tests/domains.txt, the apex,
# the www host, and a sample of random subdomains all redirect to
# https://www.jamesmaggs.com — over both HTTP and HTTPS. Random
# subdomains are generated fresh per run so they exercise true wildcard
# behaviour (e.g. Cloudflare bulk redirects + wildcard DNS) rather than
# DNS records that happen to exist.
#
# Usage: ./tests/check-redirects.sh
#
# domains.txt format: one apex domain per line (e.g. "example.com",
# not "www.example.com"). Blank lines and # comments are ignored.
#
# Exit code is 0 if every variant lands at https://www.jamesmaggs.com,
# non-zero otherwise. Depends only on curl and openssl.

set -uo pipefail

CANONICAL_HOST="www.jamesmaggs.com"
CANONICAL_SCHEME="https"
RANDOM_SUBDOMAIN_COUNT=3
CONNECT_TIMEOUT=10
MAX_TIME=30
MAX_REDIRS=10

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DOMAINS_FILE="$SCRIPT_DIR/domains.txt"

if [ -t 1 ]; then
	GREEN=$'\033[32m'
	RED=$'\033[31m'
	DIM=$'\033[2m'
	BOLD=$'\033[1m'
	RESET=$'\033[0m'
else
	GREEN=""; RED=""; DIM=""; BOLD=""; RESET=""
fi

if [ ! -f "$DOMAINS_FILE" ]; then
	printf 'Domains file not found: %s\n' "$DOMAINS_FILE" >&2
	exit 2
fi

random_label() {
	openssl rand -hex 4
}

check_url() {
	local url="$1"
	local output rc final scheme rest host
	output=$(curl -sS -L -o /dev/null \
		--connect-timeout "$CONNECT_TIMEOUT" \
		--max-time "$MAX_TIME" \
		--max-redirs "$MAX_REDIRS" \
		-w '%{url_effective}|%{http_code}|%{num_redirects}' \
		"$url" 2>&1)
	rc=$?
	if [ $rc -ne 0 ]; then
		printf '  %s[FAIL]%s %-50s %s->%s curl error (exit %d): %s\n' \
			"$RED" "$RESET" "$url" "$DIM" "$RESET" "$rc" "$output"
		return 1
	fi
	final="${output%%|*}"
	scheme="${final%%://*}"
	rest="${final#*://}"
	host="${rest%%/*}"
	host="${host%%:*}"
	if [ "$scheme" = "$CANONICAL_SCHEME" ] && [ "$host" = "$CANONICAL_HOST" ]; then
		printf '  %s[PASS]%s %-50s %s->%s %s\n' \
			"$GREEN" "$RESET" "$url" "$DIM" "$RESET" "$final"
		return 0
	fi
	printf '  %s[FAIL]%s %-50s %s->%s %s\n' \
		"$RED" "$RESET" "$url" "$DIM" "$RESET" "$final"
	return 1
}

domains=()
while IFS= read -r raw || [ -n "$raw" ]; do
	line="${raw%%#*}"
	line="${line%$'\r'}"
	read -r line <<< "$line" || true
	[ -z "$line" ] && continue
	domains+=("$line")
done < "$DOMAINS_FILE"

if [ ${#domains[@]} -eq 0 ]; then
	printf 'No domains to check. Add entries to %s.\n' "$DOMAINS_FILE" >&2
	exit 2
fi

total=0
passed=0

for apex in "${domains[@]}"; do
	printf '\n%s%s%s\n' "$BOLD" "$apex" "$RESET"
	hosts=("$apex" "www.$apex")
	for ((i=0; i<RANDOM_SUBDOMAIN_COUNT; i++)); do
		hosts+=("$(random_label).$apex")
	done
	for host in "${hosts[@]}"; do
		for scheme in http https; do
			total=$((total + 1))
			if check_url "$scheme://$host"; then
				passed=$((passed + 1))
			fi
		done
	done
done

printf '\n%s%d/%d checks passed across %d domain(s)%s\n' \
	"$BOLD" "$passed" "$total" "${#domains[@]}" "$RESET"

[ "$passed" -eq "$total" ]
