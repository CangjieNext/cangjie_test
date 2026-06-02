/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../../mod1
// EXEC: %compiler %cmp_opt %compile_lib_opt ./mod1/src/blank.cj -o ./
// EXEC-PIPE: %ls 2>&1 | compare %f
// ASSERT: scan-not blank.o
// ASSERT: scan-not blank.cjo

main(): Int64 {
    var a = a1
    var b = a
    return 0
}
