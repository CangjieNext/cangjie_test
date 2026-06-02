// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan test do_while_cond and do_while_block macro success
// ASSERT: scan test while_cond and while_block macro success
// ASSERT: scan 1
// ASSERT: scan 2
// ASSERT: scan 3

import test.*

func test_dowhile(): Int64 {
    var b = 1
    // dowhile condition @callmacro
    do {
        // block @callmacro
        print(@callTest("test do_while_cond and do_while_block macro success\n"))
        b = b - 1
    } while (b != @callTest(0))
    return 0
}

func test_while(): Int64 {
    // while condition @callmacro
    while (@callTest(true)) {
        // block @callmacro
        print(@callTest("test while_cond and while_block macro success\n"))
        break;
    }
    return 0
}

func test_for(): Int64 {
    // test for expr call macro
    let arr: Array<Int32> = [1, 2, 3]
    for (a in @callTest(arr) where @callTest(true)) {
        print(@callTest("${a}\n"))
    }
    return 0
}

main(): Int64 {
    // test dowhile call macro
    test_dowhile()

    // test while call macro
    test_while()

    // test for expr call macro
    return test_for()
}
