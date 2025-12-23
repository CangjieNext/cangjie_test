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
public class A <: M {
    public init() {
    }
    public open func foo(): Unit {
        println("in cangjie foo")
        let m = M()
    }
    public func f0(f: ObjCBlock<() -> Unit>): Unit {
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
        // M.P_staticMethod(f)
        println("调用M实现的协议中的required实例方法")
        m.P_required_instanceMethod(f)
        println("调用M实现的协议中的required静态方法")
        // M.P_required_staticMethod(f)
        println("调用M实现的协议中的optional实例方法")
        m.P_normal_optional_func()
        // m.P_optional_instanceMethod(f)
        println("调用M实现的协议中的optional静态方法")
        M.P_optional_staticMethod(f)
        println("returning from A.f0")
    }
    public func getCJBlock(): ObjCBlock<() -> Unit> {
        let ff = ObjCBlock<() -> Unit>({=> println("cj lambda")})
        println("in getCJBlock")
        ff.call()
        ff
    }
}
