/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package abc

import std.reflect.*

public interface UpStreamParent<T0, T1> {
    func UpStreamParent_NonMutInstanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_NonMutInstanceMemberFunction")
    }

    mut func UpStreamParent_MutInstanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_MutInstanceMemberFunction")
    }

    static func UpStreamParent_staticMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_staticMemberFunction")
    }

    prop UpStreamParent_NonMutInstanceMemberProperty: Int64 {
        get() {
            println(
                "UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_NonMutInstanceMemberProperty")
            114514i64
        }
    }

    mut prop UpStreamParent_MutInstanceMemberProperty: Int64 {
        get() {
            println(
                "UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_MutInstanceMemberProperty")
            114514i64
        }
        set(v) {
            println(
                "UpStreamParent<${TypeInfo.of<T0>()},${TypeInfo.of<T1>()}>.UpStreamParent_MutInstanceMemberProperty")
        }
    }

    static prop UpStreamParent_NonMutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?,?>.UpStreamParent_NonMutStaticMemberProperty")
            114514i64
        }
    }

    static mut prop UpStreamParent_MutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?,?>.UpStreamParent_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamParent<?,?>.UpStreamParent_MutStaticMemberProperty")
        }
    }
}

public open class UpStreamChild<T0, T1> <: UpStreamParent<T0, T1> {}

public interface NewParent<T0> {
    public mut func NewParent_MutInstanceMemberFunction(): Unit {
        println("NewParent<${TypeInfo.of<T0>()}>.NewParent_MutInstanceMemberFunction")
    }

    public func NewParent_NonMutInstanceMemberFunction(): Unit {
        println("NewParent<${TypeInfo.of<T0>()}>.NewParent_NonMutInstanceMemberFunction")
    }

    public static func NewParent_StaticMemberFunction(): Unit {
        println("NewParent<${TypeInfo.of<T0>()}>.NewParent_StaticMemberFunction")
    }

    public mut prop NewParent_MutInstanceMemberProperty: Int64 {
        get() {
            println("NewParent<${TypeInfo.of<T0>()}>.NewParent_MutInstanceMemberProperty")
            114514i64
        }
        set(v) {
            println("NewParent<${TypeInfo.of<T0>()}>.NewParent_MutInstanceMemberProperty")
        }
    }

    public prop NewParent_NonMutInstanceMemberProperty: Int64 {
        get() {
            println("NewParent<${TypeInfo.of<T0>()}>.NewParent_NonMutInstanceMemberProperty")
            114514i64
        }
    }

    public static prop NewParent_NonMutStaticMemberProperty: Int64 {
        get() {
            println("NewParent<?>.NewParent_NonMutStaticMemberProperty")
            114514i64
        }
    }

    public static mut prop NewParent_MutStaticMemberProperty: Int64 {
        get() {
            println("NewParent<?>.NewParent_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("NewParent<?>.NewParent_MutStaticMemberProperty")
        }
    }
}

extend<T0, T1> UpStreamChild<T0, T1> <: NewParent<T0> {}

public func checkParent<F0, F1>(i: UpStreamParent<F0, F1>): Unit {
    var instance = i
    instance.UpStreamParent_NonMutInstanceMemberFunction()
    instance.UpStreamParent_MutInstanceMemberFunction()
    instance.UpStreamParent_NonMutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty = 1i64
    UpStreamParent<F0, F1>.UpStreamParent_staticMemberFunction()
    UpStreamParent<F0, F1>.UpStreamParent_NonMutStaticMemberProperty
    UpStreamParent<F0, F1>.UpStreamParent_MutStaticMemberProperty
    UpStreamParent<F0, F1>.UpStreamParent_MutStaticMemberProperty = 1i64
}

public func checkChild<F0, F1>(i: UpStreamChild<F0, F1>): Unit {
    var instance = i
    instance.UpStreamParent_NonMutInstanceMemberFunction()
    instance.UpStreamParent_MutInstanceMemberFunction()
    UpStreamChild<F0, F1>.UpStreamParent_staticMemberFunction()
    instance.UpStreamParent_NonMutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty = 1i64
    UpStreamChild<F0, F1>.UpStreamParent_NonMutStaticMemberProperty
    UpStreamChild<F0, F1>.UpStreamParent_MutStaticMemberProperty
    UpStreamChild<F0, F1>.UpStreamParent_MutStaticMemberProperty = 1i64
}

public func checkStatic<P, T0, T1>(): Unit where P <: UpStreamParent<T0, T1> {
    P.UpStreamParent_staticMemberFunction()
    P.UpStreamParent_NonMutStaticMemberProperty
    P.UpStreamParent_MutStaticMemberProperty
    P.UpStreamParent_MutStaticMemberProperty = 1i64
}
