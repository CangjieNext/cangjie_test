// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

class A{
    static var a:Int64 = 0
}

func foo<T1, T2, T3>() {
    func test<T1, T2, T3>() {
        for (i in 0..10) {
            spawn {
                A.a++
            }
        }
        return 0
    }
    test<Int64, Int32, Int16>()
}

main() {
    return 0
}
