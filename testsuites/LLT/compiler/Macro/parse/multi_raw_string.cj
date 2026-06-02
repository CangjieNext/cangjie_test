// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_args %run_opt %output 2>&1 | compare %f

import define.*

main(): Int64 {
    @Same var a = ###"a#a#a"###
    println(a)
    a = "123"
    @Same var aa = #"abc"#;
    @Same var bb = aa;
    var cc = bb
    println(a)
    println(aa)
    println(bb)
    println(cc)
    return 0;
}

/* SCAN
a#a#a
123
abc
abc
abc
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
