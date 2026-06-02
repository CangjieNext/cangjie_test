// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

class A {
    mut prop v: Int64 {
        get() {
            println("getter");
            1
        }
        set(v) {
            println("setter")
        }
    }
}

func get(): A {
    println("A")
    A()
}

public func test<T>() {
    get().v += 1
}
