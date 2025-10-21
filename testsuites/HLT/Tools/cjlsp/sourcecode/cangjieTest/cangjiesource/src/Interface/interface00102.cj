/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Interface

interface MyInterface_1 {
    func f1(): Unit
    static func f2(): Unit
    func f3(): Unit {
        return
    }
    func f4(a!: Int64): Unit
    static func f5(): Unit
}

class C_1 <: MyInterface_1 {
    public func f1(): Unit {
        return
    }
    public static func f2(): Unit {
        return
    }
    public func f3(): Unit {
        return
    }
    public func f4(a!: Int64): Unit {
        return
    }
    public static func f5(): Unit {
        return
    }
}


func test2() {
	var a = C_1().f1()

}
