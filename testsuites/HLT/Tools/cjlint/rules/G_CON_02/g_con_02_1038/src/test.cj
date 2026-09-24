/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

class Foo {
    private let mtx: ReentrantMutex = ReentrantMutex()

    public func doSomething(a: Int64, b: Int64): Int64 {
        var c: Int64 = 0
        try {
            mtx.lock()
            c = a / b
            mtx.unlock()
        } catch (e: ArithmeticException) {
            println(e)
        } finally {
            println("done")
        }
        return c
    }
}

main() {
    let f = Foo()
    println(f.doSomething(6, 2))
}
