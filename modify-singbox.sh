#!/bin/bash

set -e

echo "✅ شروع جایگزینی فایل‌ها..."

BASE_PATH="/opt/hiddify-manager/singbox/configs"

FILE1="03_routing.json.j2"
FILE2="05_inbounds_4100_hysteria.json.j2"

URL1="https://raw.githubusercontent.com/aliakbarnajmi/hiddify-moderator/main/03_routing.json.j2"
URL2="https://raw.githubusercontent.com/aliakbarnajmi/hiddify-moderator/main/05_inbounds_4100_hysteria.json.j2"

# بکاپ گرفتن
echo "📦 گرفتن بکاپ از فایل‌های قبلی..."
cp "$BASE_PATH/$FILE1" "$BASE_PATH/$FILE1.bak"
cp "$BASE_PATH/$FILE2" "$BASE_PATH/$FILE2.bak"

# دانلود و جایگزینی
echo "⬇️ دانلود فایل جدید 03_routing.json.j2 ..."
curl -fsSL "$URL1" -o "$BASE_PATH/$FILE1"

echo "⬇️ دانلود فایل جدید 05_inbounds_4100_hysteria.json.j2 ..."
curl -fsSL "$URL2" -o "$BASE_PATH/$FILE2"

# ست کردن پرمیشن
chmod 644 "$BASE_PATH/$FILE1"
chmod 644 "$BASE_PATH/$FILE2"

# اعمال کانفیگ
echo "🚀 اعمال کانفیگ‌ها..."
/opt/hiddify-manager/apply_configs.sh

echo "✅ عملیات با موفقیت انجام شد."
