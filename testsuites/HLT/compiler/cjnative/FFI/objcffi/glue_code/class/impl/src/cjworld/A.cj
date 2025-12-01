/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

 package cjworld
import objc.lang.*
@ObjCImpl
public class A <:M {
public init() {
}
public open func foo(): Unit  {
var p = M()
println("in cangjie foo")
}

public open func aFoo0(p0: ?M): ?M {
    if (let Some(m) <- p0) {
        println("aFoo0 Some")
        m.mFoo()
        global_func1(p0)
    } else {
        println("aFoo0 None")
    }
    println("global_func() = ${global_func()}")
    println("global_func0(114514) = ${global_func0(114514)}")
    p0
}

}
