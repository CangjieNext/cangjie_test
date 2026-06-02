// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: macro_test.cj
// EXEC: %compiler %cmp_macro macro_test.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_parallel %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

public class Data<T> {
    @callTest
    public var count: T
    @callTest
    public init(x: T) {
        count = x
    }
}

func run(): Int64 {
    var i: Int32 = 2
    @callTest
    let data: Data<Int32> = Data<Int32>(i)
    var res: Int32 = data.count
    if (res == 2) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
