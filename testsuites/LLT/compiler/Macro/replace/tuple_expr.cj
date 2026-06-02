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

main(): Int64 {
    // test TupleLit children call macro
    var myTuple: (Int32, Int32) = (@callTest(10), 20)
    if (myTuple[0] != 10) {
        print("test TupleLit children call macro failed\n")
        return 1
    }
    print("test TupleLit children call macro success\n")

    var a = @callTest(myTuple)[1]
    if (a != 20) {
        print("test tuple access call macro failed\n")
        return 1
    }
    print("test tuple access call macro success\n")
    return 0
}
