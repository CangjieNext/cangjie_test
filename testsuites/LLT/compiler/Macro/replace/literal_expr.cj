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

@DeclM
func return_unit(): Unit {
    let unitLiteral = @UnitLitSame(())
    return unitLiteral
}

@DeclM // test UnitLiteral to Tokens
func foo() {
    let a1 = ()
    let a2 = ()
}

@callTest
func test_list() {
    var value: Int32 = 2
    var list1: Array<Int32> = [1, @callTest(value), 3]
    if (list1[1] != value) {
        print("test ArrayLit children call macro failed\n")
        return 1
    }
    print("test ArrayLit children call macro success\n")
    let useless = return_unit()
    return 0
}

main(): Int64 {
    if (test_list() != 0) {
        return 1
    }
    return 0
}
