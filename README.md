# Laurel Laoang, Jr. — portfolio

One static page (`index.html`), no build step. Hosted in two places:

- **GitHub Pages**: https://lslaoang.github.io — updates on every push to `main` (cached up to 10 minutes).
- **AWS**: https://d24mtkrpo0wd8c.cloudfront.net — private S3 bucket `laurel-portfolio-site` (ap-southeast-1) behind CloudFront `E32ZAJ17H6O5M9`.

## Update

```bash
git push            # GitHub Pages
./deploy.sh         # AWS: uploads index.html (no-cache) and invalidates CloudFront; needs `aws login`
```

## Preview locally

```bash
python3 -m http.server 8000
```
