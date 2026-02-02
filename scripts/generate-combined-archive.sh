#!/bin/bash
# 全アーカイブを1ページに結合
OUTPUT="archive/history_all.md"

# ヘッダー生成
cat << 'EOF' > "$OUTPUT"
---
description: 全勉強会アーカイブ（第0回〜最新）
---

<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico?">

# ロボティクス勉強会 全アーカイブ

このページは検索性向上のため、全ての勉強会記録を1ページにまとめたものです。

**年ごとの記録:**
[2020年](history2020) | [2021年](history2021) | [2022年](history2022) | [2023年](history2023) | [2024年](history2024) | [2025年](history2025)

---

EOF

# 古い年から新しい年へ順に結合
for year in 2020 2021 2022 2023 2024 2025; do
  file="archive/history${year}.md"
  if [ -f "$file" ]; then
    # frontmatter、linkタグ、Backリンク、区切り線を除去
    sed -n '/^# /,$p' "$file" | \
      sed '/^\[Back\]/d' | \
      sed '/^- - -$/d' >> "$OUTPUT"
    echo -e "\n---\n" >> "$OUTPUT"
  fi
done

echo "[Back](../index)" >> "$OUTPUT"
