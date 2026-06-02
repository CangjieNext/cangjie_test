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

class DataA {
    @callTest
    public var a = 1
    @callTest
    public init(input: Int64) {
        a = input
    }
    @callTest
    public static func testmodify() {}
}

class DataB {
    @callTest
    public var b: Int64 = 2
    @callTest(public init(input:Int64){b = input})
}

main(): Int64 {
    var da = DataA(3).a
    var db = DataB(4).b
    if (da != 3 || db != 4) {
        return 1
    }
    return 0
}
