/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE:  pkg
// EXEC: %compiler %cmp_opt %compile_lib_opt pkg/foo.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt %f pkg.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import pkg.*

extend<T> foo<T> where T <: Comparable<T> {
    public func compare(b: foo<T>) {
        if (this.num > b.num) {
            return this
        }
        return b
    }
}

func run(): Int64 {
    var a = foo<Int64>(2)
    var b = foo<Int64>(3)
    let x = a.compare(b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
