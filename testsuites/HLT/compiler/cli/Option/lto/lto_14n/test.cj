/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DESCRIPTION: empty value for option --lto
// EXEC-PIPE-1: %compiler %cmp_opt --lto= %f -o %output 2>&1 | compare %f
// ASSERT: scan-not does not support
// ASSERT: scan option '--lto' requires some values, format: option=value or option="v1, v2..."
// ASSERT: scan invalid value: ''

main(): Int64 {
    return 0
}
