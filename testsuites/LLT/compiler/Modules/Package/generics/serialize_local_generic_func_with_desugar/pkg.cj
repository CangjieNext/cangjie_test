// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

class A {
    prop a: Int64 {
        get() {
            0
        }
    }
}

public func foo<T>() {
    func test(_: Unit) {
        A()
    }
    test(if (true) {
        func g<T>(a: T) {
            a
        }
    }).a
}
