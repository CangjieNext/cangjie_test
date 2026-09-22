/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

open class Base {
    private let baseMtx: Mutex = Mutex()
    public open func doSomething(): Unit {
        synchronized(baseMtx) {
            println("base")
        }
    }
}

class Derived <: Base {
    private let mtx: Mutex = Mutex()
    public override func doSomething(): Unit {
        synchronized(mtx) {
            println("derived")
        }
    }
}

main() {
    let d: Base = Derived()
    d.doSomething()
}
