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

func match_case(): Int64 {
    var i: Array<Int32> = [60, 70, 80]
    let j: Int32 = 60
    var a = match (j) {
        case 60 where @callTest(true) => @callTest(2)
        case 70 where true => 1
        case _ => 0
    }
    if (a != 2) {
        print("test match case call macro failed\n")
        return 1
    }
    print("test match case call macro success\n")
    return 0
}

func match_case_other(): Int64 {
    let j: Int32 = 60
    var a = match {
        case @callTest(j < 70) => 1
        case _ => 0
    }
    if (a != 1) {
        print("test matchCaseOther call macro failed\n")
        return 1
    }
    print("test match case call macro success\n")
    return 0
}

func match_expr(): Int64 {
    var i: Int32 = 0
    var res: String = match (@callTest(i)) {
        case 0 => "0"
        case _ => "default"
    }
    if (res != "0") {
        print("test match expr call macro failed\n")
        return 1
    }
    print("test match expr call macro success\n")
    return 0
}

main(): Int64 {
    // test match expr call macro
    if (match_expr() != 0) {
        return 1
    }

    // test match case other call macro
    if (match_case_other() != 0) {
        return 2
    }

    // test match case call macro
    return match_case()
}
