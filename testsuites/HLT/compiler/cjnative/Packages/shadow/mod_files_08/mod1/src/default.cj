/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %pkg_opt %compile_lib_opt ./mod1/src/p1 -o ./
// EXEC-PIPE: %ls 2>&1 | compare %f
// ASSERT: regex-not \.o
// ASSERT: regex-not \.cjo

main(): Int64 {
    var a = a1
    var b = a
    return 0
}
