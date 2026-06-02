/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  return_one.cj
// EXEC: %compiler %cmp_macro return_one.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output
// RUN-EXEC: %run %run_opt %output  %run_macro_opt %run_args

import return_one.*

var flag: Int64 = 0

func test(input: String) {
    if (input != "1") {
        flag = flag + 1
    }
}

func a1(input!: String = "${@VAR_A(@VAR_A(0))}") {
    input
}

func b1(input!: String = "${@VAR_B @VAR_B var x = 1}") {
    input
}

func c1(input!: String = "${@VAR_C[0](@VAR_C[0](0))}") {
    input
}

func d1(input!: String = "${@VAR_D[0] @VAR_D[0] var x = 1}") {
    input
}

func a2(input!: String = "${@VAR_A(@VAR_D[0] var x = 1)}") {
    input
}

func b2(input!: String = "${@VAR_B @VAR_A(0)}") {
    input
}

func c2(input!: String = "${@VAR_C[0](@VAR_B var x = 1)}") {
    input
}

func d2(input!: String = "${@VAR_D[0] @VAR_C[0](0)}") {
    input
}

func a3(input!: String = "${@VAR_A(@VAR_C[0](0))}") {
    input
}

func b3(input!: String = "${@VAR_B @VAR_D[0] var x = 1}") {
    input
}

func c3(input!: String = "${@VAR_C[0](@VAR_A(0))}") {
    input
}

func d3(input!: String = "${@VAR_D[0] @VAR_B var x = 1}") {
    input
}

func a4(input!: String = "${@VAR_A(@VAR_B var x = 1)}") {
    input
}

func b4(input!: String = "${@VAR_B @VAR_C[0](0)}") {
    input
}

func c4(input!: String = "${@VAR_C[0](@VAR_D[0] var x = 1)}") {
    input
}

func d4(input!: String = "${@VAR_D[0] @VAR_A(0)}") {
    input
}

main() {
    test(a1())
    test(a2())
    test(a3())
    test(a4())
    test(b1())
    test(b2())
    test(b3())
    test(b4())
    test(c1())
    test(c2())
    test(c3())
    test(c4())
    test(d1())
    test(d2())
    test(d3())
    test(d4())
    return flag
}
