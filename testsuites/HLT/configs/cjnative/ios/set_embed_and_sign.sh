#!/bin/bash
# save as: set_embed_and_sign.sh

set -e

PROJECT_PATH="$1"
TARGET_NAME="$2"

if [ -z "$PROJECT_PATH" ]; then
    echo "用法: $0 <项目路径> [目标名称]"
    echo "示例: $0 MyProject.xcodeproj 'MyApp'"
    exit 1
fi

PBXPROJ_PATH="${PROJECT_PATH}/project.pbxproj"

if [ ! -f "$PBXPROJ_PATH" ]; then
    echo "错误: 找不到 project.pbxproj 文件"
    exit 1
fi

# 备份原始文件
BACKUP_PATH="${PBXPROJ_PATH}.backup.$(date +%Y%m%d%H%M%S)"
cp "$PBXPROJ_PATH" "$BACKUP_PATH"
echo "已创建备份: $BACKUP_PATH"

# 使用 sed 修改文件
# 查找所有在 Frameworks 构建阶段中的文件
echo "正在设置 Embed & Sign..."

# 临时文件
TEMP_FILE="${PBXPROJ_PATH}.tmp"

# 处理文件
awk '
# 标记是否在 Frameworks 构建阶段
in_frameworks_phase = 0

# 查找 Frameworks 构建阶段
/Frameworks/ && /buildPhase/ {
    in_frameworks_phase = 1
}

# 处理构建文件
/^[[:space:]]*[A-F0-9]{24} \/\* .* in Frameworks \*\/ = {/,/^[[:space:]]*};/ {
    if ($0 ~ /.*= \{.*/) {
        # 开始一个新的构建文件
        print $0
    } else if ($0 ~ /^[[:space:]]*};/) {
        # 结束构建文件
        if (in_frameworks_phase) {
            # 在结束前添加 settings
            print "\t\tsettings = {ATTRIBUTES = (CodeSignOnCopy, RemoveHeadersOnCopy); };"
        }
        print $0
        in_frameworks_phase = 0
    } else {
        print $0
    }
    next
}

# 其他行
{
    print $0
}
' "$PBXPROJ_PATH" > "$TEMP_FILE"

# 替换原文件
mv "$TEMP_FILE" "$PBXPROJ_PATH"

echo "✅ 完成! 所有 Frameworks 已设置为 Embed & Sign"
echo "⚠️  注意: 请用 Xcode 打开项目验证设置"