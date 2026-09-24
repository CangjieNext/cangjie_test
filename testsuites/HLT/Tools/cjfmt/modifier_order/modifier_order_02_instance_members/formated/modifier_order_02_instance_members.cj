/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class Base {
    public open func f(): Unit {
        println("base f")
    }

    public open func g(): Unit {
        println("base g")
    }

    public open prop p: Int64 {
        get() {
            return 1
        }
    }
}

open class Child <: Base {
    public override func f(): Unit {
        println("child f")
    }

    public open override func g(): Unit {
        println("child g")
    }

    public override prop p: Int64 {
        get() {
            return 2
        }
    }
}

main() {
    let c = Child()
    c.f()
    c.g()
    println("${c.p}")
}
