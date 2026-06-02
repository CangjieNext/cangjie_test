/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f 2>&1 | compare %f

main() {
    var access_level = "user";
    if (access_level == "user‮ ⁦// Check if admin⁩ ⁦") {
        return 0
    } else {
        return 1
    }
}
// ASSERT: scan lex_unsecure_unicode
