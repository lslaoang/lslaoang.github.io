#!/usr/bin/env bash
# Upload the portfolio to S3 and refresh CloudFront.
# Usage: BUCKET=my-bucket DIST_ID=E123ABC ./deploy.sh
set -euo pipefail

BUCKET="${BUCKET:-laurel-portfolio-site}"
DIST_ID="${DIST_ID:-E32ZAJ17H6O5M9}"
cd "$(dirname "$0")"

# no-cache: browsers and CloudFront re-check the page on every visit, so updates show up right away
aws s3 cp index.html "s3://$BUCKET/index.html" \
  --content-type "text/html; charset=utf-8" \
  --cache-control "no-cache"

aws cloudfront create-invalidation \
  --distribution-id "$DIST_ID" \
  --paths "/" "/index.html" \
  --query Invalidation.Id --output text

echo "Deployed. Live at your CloudFront URL (Distribution $DIST_ID)."
