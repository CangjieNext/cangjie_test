#!/bin/bash
# save as: embed_dylibs.sh
# 快速设置所有 dylib 为 Embed & Sign

if [[ $# -eq 0 ]]; then
    echo "用法: $0 <项目路径>"
    exit 1
fi

PROJECT="$1"
PBXPROJ="${PROJECT}/project.pbxproj"

if [[ ! -f "$PBXPROJ" ]]; then
    echo "错误: 找不到 project.pbxproj"
    exit 1
fi

# 备份
BACKUP="${PBXPROJ}.backup.$(date +%s)"
cp "$PBXPROJ" "$BACKUP"
echo "备份: $BACKUP"

# 处理逻辑
echo "查找 dylib 文件..."
DYLIBS=$(grep -n "\.dylib.*in Frameworks" "$PBXPROJ")

if [[ -z "$DYLIBS" ]]; then
    echo "没有找到 dylib 文件"
    exit 0
fi

echo "找到以下 dylib:"
echo "$DYLIBS" | sed 's/^/  /'

# 使用 awk 处理
awk '
BEGIN { changed = 0 }
/\.dylib.*in Frameworks/ {
    # 找到 dylib
    print "处理: " $0
    in_dylib = 1
    dylib_line = NR
}

in_dylib && /^[[:space:]]*};/ {
    # 在 dylib 块结束前
    if (!/CodeSignOnCopy/) {
        # 插入 settings
        gsub(/};/, "settings = {ATTRIBUTES = (CodeSignOnCopy, RemoveHeadersOnCopy); }; };")
        changed = 1
    }
    in_dylib = 0
}

{ print }
END {
    if (changed) {
        print "✅ 修改已保存"
    } else {
        print "ℹ️  没有需要修改的内容"
    }
}
' "$PBXPROJ" > "${PBXPROJ}.tmp" && mv "${PBXPROJ}.tmp" "$PBXPROJ"

echo "完成! 请用 Xcode 验证设置。"