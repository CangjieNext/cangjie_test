// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A<T, T2> {
    var b: T
    var a : T2
    A(para : T2, para2: T) {
        a = para
        b = para2
    }
    func goo<U>(para: Int64) {
        var z = 999
        func goo2<K1, K2>() {
            return 0
        }
        return 0
    }
}


func foo1<T1>() {
    func foo2<T2, T4>() {
        func foo3<T3>() {
            return 0
        }
        foo3<Int64>()
        return 0
    }
    foo2<Int64, Int32>()
    return 0
}

func f1<T1, T2>(p1: T1, p2: T2) {
    return 0
}

main() {
    0
}