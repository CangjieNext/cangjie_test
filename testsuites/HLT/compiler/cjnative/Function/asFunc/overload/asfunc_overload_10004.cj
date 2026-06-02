/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

open class A {
    public operator func ()() {
        1
    }
    public operator func ()(input: Int64) {
        2
    }
}

class B <: A {
    public operator func ()(input: Int32) {
        3
    }
    public func test() {
        var b = B()
        return b() + b(1) - 3
    }
}

main() {
    var a: B = B()
    return a.test()
}
