/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan-not '-emit-ir' is a frontend option, require '-frontend' as the first option

main(): Int64 {
    var a: Int32 = 1
    var b: Int32 = 2
    if (a < b) {
        print("hello,worldn")
        return 0
    }
    return 1
}
