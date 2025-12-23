/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package cjworld

import objc.lang.*

public class Value {
    public Value(public var value: Int64) {}
}

@ObjCImpl
public class A <: M {
    public let A_instanceVariable0: ObjCBlock<() -> Unit> = ObjCBlock<() -> Unit>({=> println("A.A_instanceVariable0")})
    public static let A_staticVariable0: ObjCBlock<() -> Unit> = ObjCBlock<() -> Unit>(
        {=> println("A.A_staticVariable0")})
    public prop A_instanceProperty0: ObjCBlock<() -> Unit> {
        get() {
            ObjCBlock<() -> Unit>({=> println("A.A_instanceProperty0")})
        }
    }
    public static prop A_staticProperty0: ObjCBlock<() -> Unit> {
        get() {
            ObjCBlock<() -> Unit>({=> println("A.A_staticProperty0")})
        }
    }
    public init() {
    }
    // 构造器入参类型为block类型
    @ForeignName["initWithP0:p1:p2:"]
    public init(p0: ObjCBlock<() -> Unit>, p1!: ObjCBlock<() -> Unit>,
        p2!: ObjCBlock<() -> Unit> = ObjCBlock<() -> Unit>({=> println("init.p2")})) {
        p0.call()
        p1.call()
        p2.call()
    }
    public open func foo(): Unit {
        println("in cangjie foo")
        let m = M()
    }
    public static func staticFunction(f: ObjCBlock<() -> Unit>): ObjCBlock<() -> Unit> {
        f.call()
        f
    }
    public func A_instanceFunction(f: ObjCBlock<() -> Unit>): ObjCBlock<() -> Unit> {
        let capturedValue = Value(123)
        let ff = ObjCBlock<() -> Unit>({=> println("A_instanceFunction.lambda ${capturedValue.value}")})
        println("in instanceFunction")
        ff.call()
        ff
    }

    public func f0(f: ObjCBlock<() -> Unit>): ObjCBlock<() -> Unit> {
        // 调用全局函数
        global_func1(f)
        unsafe { global_func() }
        f.call()
        let ff = ObjCBlock<() -> Unit>({=> println("cj lambda")})
        let m = M()
        // @interface
        println("调用oc class的实例方法，传入block")
        m.instanceMethod(f)
        println("调用oc class的静态方法，传入block")
        M.staticMethod(f)
        m.instanceVariable0.call()
        m.instanceVariable1.call(123)
        m.instanceProperty0.call()
        m.instanceProperty1.call(3.14)
        // @protocol
        println("调用M实现的协议中的实例方法")
        m.P_instanceMethod(f)
        println("调用M实现的协议中的静态方法")
        // M.P_staticMethod(f) // crash
        println("调用M实现的协议中的required实例方法")
        m.P_required_instanceMethod(f)
        println("调用M实现的协议中的required静态方法")
        // M.P_required_staticMethod(f) // crash
        println("调用M实现的协议中的optional实例方法")
        m.P_normal_optional_func()
        // M.P_normal_optional_static_method() // crash
        // m.P_optional_instanceMethod(f) // crash
        println("调用M实现的协议中的optional静态方法")
        // M.P_optional_staticMethod(f) // crash
        println("returning from A.f0")
        ff
    }
}
