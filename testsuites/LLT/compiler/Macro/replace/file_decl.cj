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

//VarDecl
@callTest
var a = 0

@callTest(var b = 0)

//EnumDecl
@callTest
enum Timeunit {
    Year | Month | Day | Hour
}

//FuncDecl
@callTest
func MyFunc() {
    var counter = 0
}

//StructDecl
@callTest
struct Data {
    var a: Int64
    init(ia: Int64) {
        a = ia
    }
}

//ClassLikeDecl
@callTest
class DataA {
    var a = 1
    init(input: Int64) {
        a = input
    }
}

@callTest
interface A {
    func test(): Int64 {
        1
    }
}

//extend
@callTest
extend DataA <: A {
    public func test(): Int64 {
        2
    }
}

main(): Int64 {
    if (DataA(0).test() != 2) {
        return 1
    }
    return 0
}
