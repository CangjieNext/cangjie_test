/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Interface

interface I7 {
    func f1(): Unit
    func f2(): Unit {
        return
    }
    static func f3(): C7
}

class C7 <: I7 {
    public func f1(): Unit {}
    public func f2(): Unit {
        return
    }
    public static func f3(): C7 {
        return C7()
    }
}

func main7() {
    C7().f1()

}
