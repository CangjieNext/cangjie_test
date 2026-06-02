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
// EXEC-PIPE-1: %compiler %cmp_opt %f pkg.%middle -o %n.%suffix 2>&1 | compare %f

import pkg.I

class foo {
    public init() {}
    public var num: Int32 = 0
    public init(num: Int32) {
        this.num = num
    }
}

extend foo <: I {
    public func compare(b: foo): foo {
        if (this.num > b.num) {
            return this
        }
        return b
    }
}

func run(): Int64 {
    var a = foo(2)
    var b = foo(3)
    let x = compare(a, b)
    if (x.num == 3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
// ASSERT: scan package_decl_not_find_in_package
