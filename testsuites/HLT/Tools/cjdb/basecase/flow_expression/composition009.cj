/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

interface I1 {
    func f1(a: Int64): Int64
    func f2(a: Bool): Bool {
        true
    }
}

class C1 <: I1 {
    public func f1(a: Int64): Int64 {
        1
    }
    func f3(a: Bool): Int64 {
        1
    }
}

interface I2<T> {
    func f1(a: T): T
    func f2(a: T): T {
        a
    }
}

struct S1<T> <: I2<T> {
    public func f1(a: T): T {
        a
    }
}

main() {
    var a1 = C1().f1 ~> C1().f1
    var a2 = C1().f2 ~> C1().f3
    var a3 = S1<Int64>().f1 ~> S1<Int64>().f1
    var a4 = S1<Int64>().f1 ~> S1<Int64>().f2
    0
}
