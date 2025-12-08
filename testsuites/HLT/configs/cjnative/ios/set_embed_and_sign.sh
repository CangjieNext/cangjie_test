#!/bin/bash
# set_all_dylibs_embed_sign.sh
# 功能：扫描并设置所有动态库为 Embed & Sign

set -euo pipefail

PROJECT_PATH="$1"
PBXPROJ="${PROJECT_PATH}/project.pbxproj"

if [[ ! -f "$PBXPROJ" ]]; then
    echo "❌ 错误: 找不到 project.pbxproj"
    exit 1
fi

# 备份
BACKUP="${PBXPROJ}.backup.$(date +%s)"
cp "$PBXPROJ" "$BACKUP"
echo "✅ 备份已创建: $BACKUP"

echo "🔍 开始扫描动态库..."

# 临时文件
TEMP_FILE=$(mktemp)

# 计数器
TOTAL_COUNT=0
FIXED_COUNT=0

# 使用 awk 处理，精确控制每一行
awk '
BEGIN {
    in_frameworks_section = 0
    current_dylib = ""
    fixed_count = 0
}

# 标记进入 Frameworks 相关部分
/PBXFileSystemSynchronizedGroupBuildPhaseMembershipExceptionSet/ {
    in_frameworks_section = 1
    print
    next
}

# 标记退出 Frameworks 相关部分  
/End PBXFileSystemSynchronizedGroupBuildPhaseMembershipExceptionSet/ {
    in_frameworks_section = 0
    print
    next
}

# 在 Frameworks 部分中，查找 dylib 定义
in_frameworks_section && /\.dylib.*=.*\(.*\);/ {
    line = $0
    dylib_name = ""
    
    # 提取 dylib 文件名
    if (match(line, /[^=]*\.dylib/)) {
        dylib_name = substr(line, RSTART, RLENGTH)
        gsub(/^[[:space:]]+|[[:space:]]+$/, "", dylib_name)
    }
    
    if (dylib_name != "") {
        TOTAL_COUNT++
        print "📦 处理动态库: " dylib_name > "/dev/stderr"
        
        # 检查当前属性
        if (line ~ /CodeSignOnCopy.*RemoveHeadersOnCopy/) {
            print "  ✅ 已经是 Embed & Sign" > "/dev/stderr"
            print line
        }
        else if (line ~ /CodeSignOnCopy/) {
            # 只有 CodeSignOnCopy，添加 RemoveHeadersOnCopy
            gsub(/CodeSignOnCopy,?/, "CodeSignOnCopy, RemoveHeadersOnCopy", line)
            print "  🔧 添加 RemoveHeadersOnCopy" > "/dev/stderr"
            fixed_count++
            print line
        }
        else {
            # 没有设置，添加完整属性
            gsub(/\([^)]*\)/, "(CodeSignOnCopy, RemoveHeadersOnCopy)", line)
            print "  🔧 设置为 Embed & Sign" > "/dev/stderr"
            fixed_count++
            print line
        }
    }
    next
}

# 其他行直接输出
{
    print
}

END {
    print "🎯 总计处理了 " TOTAL_COUNT " 个动态库" > "/dev/stderr"
    print "🔧 修复了 " fixed_count " 个动态库" > "/dev/stderr"
}
' "$PBXPROJ" > "$TEMP_FILE"

# 检查是否有修改
if ! diff -q "$PBXPROJ" "$TEMP_FILE" > /dev/null; then
    mv "$TEMP_FILE" "$PBXPROJ"
    echo "✅ 修改已保存到 project.pbxproj"
else
    rm "$TEMP_FILE"
    echo "ℹ️ 没有需要修改的内容"
fi

echo ""
echo "🎉 处理完成!"