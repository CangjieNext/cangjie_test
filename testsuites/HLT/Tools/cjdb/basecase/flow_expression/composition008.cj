/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1<T> {
    func f1(a: T): Float32 {
        1.0
    }
    static func f2(a: T): Bool {
        true
    }
    func f3<T>(a: T) {
        a
    }
    func f4(a: Int64): Int64 {
        1
    }
}

struct S1<T> {
    func f1(a: T): Float32 {
        1.0
    }
    static func f2(a: T): Bool {
        true
    }
    func f3<T>(a: T) {
        a
    }
    func f4(a: Int64): Int64 {
        1
    }
}

main() {
    var b1 = C1<Int64>().f1 ~> C1<Float32>().f3<Float32>
    var b2 = C1<Int64>().f4 ~> C1<Int64>.f2
    var b3 = S1<Int64>().f1 ~> S1<Float32>().f3<Float32>
    var b4 = S1<Int64>().f4 ~> S1<Int64>.f2
    0
}
