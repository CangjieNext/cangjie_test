/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*

var res: Int64 = 0

open class Base {
    private let baseMtx: ReentrantMutex = ReentrantMutex()
    public open func doSomething(): Unit {
        baseMtx.lock()
        res += 1
        baseMtx.unlock()
    }
}

class Derived <: Base {
    public override func doSomething(): Unit {
        res += 1
    }
}

main() {
    let d: Base = Derived()
    d.doSomething()
}
