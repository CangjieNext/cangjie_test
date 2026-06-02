// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
package a

foreign func xxx0(): Unit

@C
func foo(): Unit {
    println("I'm foo")
}

public interface IA {
    func bar(n: Int64) {
        println("bar: ${n}")
        unsafe {
            xxx0()
            foo()
        }
    }
}
