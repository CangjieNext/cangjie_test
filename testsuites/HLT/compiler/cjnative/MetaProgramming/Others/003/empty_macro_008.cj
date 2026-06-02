/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_b.cj
// EXEC: %compiler  define_b.cj %cmp_macro
// EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC: %run %run_opt %output  %run_args

package test

import std.ast.*
import define_b.*

func test1() {
    @testa(1)
    @testa(

        func temp(){}
    )
    @testb[ 1](  )
    @testb[ 1](func temp(){})
}

main() {
    test1()
    return 0
}
