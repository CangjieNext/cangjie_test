// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

main(): Int64 {
    // test vardecl initializer call macro
    var a: Int32 = @callTest(1)
    if (a != 1) {
        print("test vardecl init call macro failed\n")
        return 1
    }

    // test assign expr call macro
    a = @callTest(2)
    if (a != 2) {
        print("test assign expr call macro failed\n")
        return 1
    }

    // test conv expr call macro
    var b: Int64 = Int64(@callTest(a))
    if (b != 2) {
        print("test conv expr call macro failed\n")
        return 1
    }
    return 0
}
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
