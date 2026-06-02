// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import test.*

func testifcond() {
    // if condition @callmacro
    if (@callTest(true)) {
        // if block @callmacro
        print(@callTest("test if_cond and if_block macro success\n"))
        return 0
    }
    return 1
}

func testelseifcond() {
    if (false) {
        return 1
    }
        // elseif condition @callmacro
        else if (@callTest(true)) {
        // elseif block @callmacro
        print(@callTest("test else_if_cond and else_if_block macro success\n"))
        return 0
    } else {
        // else block @callmacro
        print(@callTest("else block good\n"))
    }
    return 1
}

func testelse() {
    if (false) {
        return 1
    } else {
        // else block @callmacro
        print(@callTest("test else_block macro success\n"))
        return 0
    }
    return 1
}

func testif(): Int64 {
    testifcond()

    testelseifcond()

    testelse()

    return 0
}

func test_unary(): Int64 {
    // test unary call macro
    var a: Int8 = 10
    var b: Int8 = 0
    var c: Int8 = -11
    b = !@callTest(a)
    if (b != c) {
        return 1
    }
    print("test unary expr call macro success\n")
    return 0
}

func test_binary(): Int64 {
    // test binary call macro
    var c = 2
    if (c == @callTest(0)) {
        print("test binary right expr call macro failed\n")
        return 1
    }
    print("test binary right expr call macro success\n")

    if (@callTest(2) != c) {
        print("test binary left expr call macro failed\n")
        return 1
    }
    print("test binary left expr call macro success\n")
    return 0
}

func test_ternary(): Int64 {
    var a = 0
    var b = 1
    // test ternary expr call macro
    var c = if (@callTest(true)) {
        @callTest(a)
    } else {
        @callTest(b)
    }
    if (c != a) {
        return 1
    }
    print("test ternary expr call macro success\n")
    return 0
}

main(): Int64 {
    // test unary call macro
    test_unary()

    // test binary call macro
    test_binary()

    // test ternary call macro
    test_ternary()

    // test if call macro
    testif()
}

/* SCAN
test unary expr call macro success
test binary right expr call macro success
test binary left expr call macro success
test ternary expr call macro success
test if_cond and if_block macro success
test else_if_cond and else_if_block macro success
test else_block macro success
*/
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

