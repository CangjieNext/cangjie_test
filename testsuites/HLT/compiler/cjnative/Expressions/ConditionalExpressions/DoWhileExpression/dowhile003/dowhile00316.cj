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
class A {
    public var a: Int64 = 1
    public func test(): Int64 {
        var b = 10
        do {
            b = b - this.a
        } while (b != 0)
        return 0
    }
}

main(): Int64 {
    var b = 10
    do {
        b = b - 1
    } while (b != 0)
    var a = A()
    a.test()
    return 0
}
