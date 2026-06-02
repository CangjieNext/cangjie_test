// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package b

@C
private func foo(): Unit {
    println("I'm foo")
}

public interface IB {
    func bar(n: Int64) {
        println("barB: ${n}")
        unsafe {
            foo()
        }
    }
}
