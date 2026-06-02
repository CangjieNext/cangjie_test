// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

func testarg(a!: Int32 = 2) {
    if (a == 3) {
        print("test funcarg call macro success\n")
        return 0
    }
    return 1
}

func testparam(a!: Int32 = @callTest(2)) {
    if (a == 2) {
        print("test funcparam assign call macro success\n")
        return 0
    }
    return 1
}

func testbody(): Int64 {
    // test funcbody expr @callmacro
    var a: Int32 = 2
    @callTest(a = a + 1)
    if (a != 3) {
        return 1
    }
    print("test funcbody call macro success\n")
    return 0
}

main(): Int64 {
    // test funcarg expr @callmacro
    if (testarg(a: @callTest(3)) != 0) {
        print("test funcarg call macro failed\n")
        return 1
    }
    // test funcparam expr @callmacro
    if (testparam() != 0) {
        print("test funcparam assign call macro failed\n")
        return 1
    }
    // test funcbody expr @callmacro
    if (testbody() != 0) {
        print("test funcbody call macro failed\n")
        return 1
    }
    // test return expr @callmacro
    return @callTest(0)
}
