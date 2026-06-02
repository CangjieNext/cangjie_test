/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: ./src 
// EXEC-PIPE-1: %compiler %cmp_opt %compile_lib_opt %pkg_opt -o . 2>&1 |compare %f

// ASSERT: regex error.*?expected one package path to build

import aoo.*

main(): Int64 {
    let a = aoo.one
    let b = boo.two
    let res = a + b
    if (res != 3) {
        return 1
    }
    return 0
}
// ASSERT: regex-not no position error occurred
