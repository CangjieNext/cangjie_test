/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

interface I {
    func f1(): Unit
    func f2(): Unit {
        return
    }
    static func f3(): C
}

class C <: I {
    public func f1(): Unit {}
    public func f2(): Unit {
        return
    }
    public static func f3(): C {
        return C()
    }
}

func main5(): Int64 {
    var c = C()
    c.f1()
    C.f3()

    return 0
}
