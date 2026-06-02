/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkgb/pkgb.cj -o pkgb.%middle
// EXEC: %compiler %cmp_opt %f  pkga.%middle pkgb.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkga.f
import pkgb
import pkga

open class Base {
    public var count: Int32
    public init(x: Int32) {
        count = x
    }
    public init() {
        this(0)
    }
}

class Data <: Base {
    public var result: Int32
    public init(res: Int32) {
        result = res + 1
    }
}

func run(): Int64 {
    var res1: Data = pkga.f<Data>(Data(3))
    var res2: Base = pkgb.f<Base>(Base(3))
    if (res1.result == 4 && res2.count == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
