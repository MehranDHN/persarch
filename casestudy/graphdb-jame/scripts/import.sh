#!/usr/bin/env bash
# Import the Jameh Isfahan case study into a running GraphDB.
# Usage:
#   GRAPHDB=http://localhost:7200 REPO=jame-isfahan ./scripts/import.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
GRAPHDB="${GRAPHDB:-http://localhost:7200}"
REPO="${REPO:-jame-isfahan}"
AUTH="${GRAPHDB_AUTH:-}"   # e.g. -u admin:root

curl_auth() {
  if [[ -n "$AUTH" ]]; then
    curl -sS -u "$AUTH" "$@"
  else
    curl -sS "$@"
  fi
}

echo "GraphDB: $GRAPHDB  repo: $REPO"

# Create repo if missing (ignore error if it exists)
if ! curl_auth -f "$GRAPHDB/repositories/$REPO/size" >/dev/null 2>&1; then
  echo "Creating repository $REPO ..."
  curl_auth -f -X POST \
    -H "Content-Type: application/x-turtle" \
    --data-binary @"$ROOT/config/graphdb-repo.ttl" \
    "$GRAPHDB/rest/repositories" \
    || echo "Workbench REST create failed — create the repo manually from config/graphdb-repo.ttl"
fi

import_file() {
  local file="$1"
  local context="$2"
  echo "Importing $(basename "$file") -> $context"
  curl_auth -f -X POST \
    -H "Content-Type: text/turtle" \
    --data-binary @"$file" \
    "$GRAPHDB/repositories/$REPO/statements?context=$(python3 -c "import urllib.parse,sys; print(urllib.parse.quote(sys.argv[1], safe=''))" "$context")"
}

import_file "$ROOT/rdf/00-crm-crmba-subset.ttl" "http://www.cidoc-crm.org/cidoc-crm/"
import_file "$ROOT/rdf/01-bot.ttl"              "https://w3id.org/bot"
import_file "$ROOT/rdf/02-jame-schema.ttl"      "https://example.org/jame-isfahan/graph/schema"
import_file "$ROOT/rdf/03-jame-data.ttl"        "https://example.org/jame-isfahan/graph/data"

echo "Statements in $REPO:"
curl_auth -H "Accept: text/plain" "$GRAPHDB/repositories/$REPO/size"
echo
echo "Done. Open $GRAPHDB and select repository $REPO."
