#!/bin/bash
# Build script: injects env vars into index.html
mkdir -p dist

cp index.html dist/index.html
sed -i "s/%%FIREBASE_API_KEY%%/${FIREBASE_API_KEY}/g" dist/index.html
sed -i "s/%%FIREBASE_AUTH_DOMAIN%%/${FIREBASE_AUTH_DOMAIN}/g" dist/index.html
sed -i "s/%%FIREBASE_PROJECT_ID%%/${FIREBASE_PROJECT_ID}/g" dist/index.html
sed -i "s/%%FIREBASE_STORAGE_BUCKET%%/${FIREBASE_STORAGE_BUCKET}/g" dist/index.html
sed -i "s/%%FIREBASE_MESSAGING_SENDER_ID%%/${FIREBASE_MESSAGING_SENDER_ID}/g" dist/index.html
sed -i "s/%%FIREBASE_APP_ID%%/${FIREBASE_APP_ID}/g" dist/index.html

cp favicon.svg dist/
cp app-icon.svg dist/
cp manifest.json dist/
