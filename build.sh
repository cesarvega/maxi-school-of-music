#!/bin/bash
# Build script: injects env vars into index.html
mkdir -p dist

# Use node for reliable cross-platform replacement
node -e "
let html = require('fs').readFileSync('index.html','utf8');
const vars = {
  '%%FIREBASE_API_KEY%%': process.env.FIREBASE_API_KEY || '',
  '%%FIREBASE_AUTH_DOMAIN%%': process.env.FIREBASE_AUTH_DOMAIN || '',
  '%%FIREBASE_PROJECT_ID%%': process.env.FIREBASE_PROJECT_ID || '',
  '%%FIREBASE_STORAGE_BUCKET%%': process.env.FIREBASE_STORAGE_BUCKET || '',
  '%%FIREBASE_MESSAGING_SENDER_ID%%': process.env.FIREBASE_MESSAGING_SENDER_ID || '',
  '%%FIREBASE_APP_ID%%': process.env.FIREBASE_APP_ID || ''
};
for (const [k,v] of Object.entries(vars)) html = html.split(k).join(v);
require('fs').writeFileSync('dist/index.html', html);
"

cp favicon.svg dist/
cp app-icon.svg dist/
cp manifest.json dist/
cp level1.mp3 dist/ 2>/dev/null || true
cp level2.mp3 dist/ 2>/dev/null || true
