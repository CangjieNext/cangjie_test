/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a.cj
// EXEC: %compiler define_a.cj %cmp_macro
// EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC: %run %run_opt %output  %run_args

package test

import std.ast.*
import define_a.*

func test1() {
    var a: Tokens = quote()
    var b: Tokens = quote(


    )
    @testa()
    @testa(


    )
    @testb[]()

    @testb[

        
    ]()
}

main() {
    test1()
    return 0
}
