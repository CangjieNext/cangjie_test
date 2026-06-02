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

class Data {
    public static var a = 1
}

main(): Int64 {
    // test member access call macro
    var res = @callTest(Data).a
    if (res != Data.a) {
        print("test member access call macro failed\n")
        return 1
    }

    // test call expr call macro
    @callTest(print)("${res}\n")
    return 0
}
