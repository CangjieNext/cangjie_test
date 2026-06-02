/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgc/pkgc.cj -o pkgc.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgd/pkgd.cj -o pkgd.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkge/pkge.cj -o pkge.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgf/pkgf.cj -o pkgf.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgg/pkgg.cj -o pkgg.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgh/pkgh.cj -o pkgh.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgi/pkgi.cj -o pkgi.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgj/pkgj.cj -o pkgj.%middle
// EXEC: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle pkgc.%middle pkgd.%middle pkge.%middle pkgf.%middle pkgg.%middle pkgh.%middle pkgi.%middle pkgj.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga
import pkgb
import pkgc
import pkgd
import pkge
import pkgf
import pkgg
import pkgh
import pkgi
import pkgj

main(): Int64 {
    let a = pkga.one
    let b = pkgb.two
    let c = pkgc.three
    let d = pkgd.four
    let e = pkge.five
    let f = pkgf.six
    let g = pkgg.seven
    let h = pkgh.eight
    let i = pkgi.nine
    let j = pkgj.ten
    let res = a + b + c + d + e + f + g + h + i + j
    if (res != 55) {
        return 1
    }
    return 0
}
