/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.reflect.*

public open class UpStreamParent<T0> {
    func UpStreamParent_instanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_instanceMemberFunction")
    }

    static func UpStreamParent_staticMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_staticMemberFunction")
    }

    prop UpStreamParent_instanceMemberProperty: Int64 {
        get() {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_instanceMemberProperty")
            114514i64
        }
    }

    static prop UpStreamParent_staticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?>.UpStreamParent_staticMemberProperty")
            114514i64
        }
    }
}

public open class UpStreamChild<T0> <: UpStreamParent<T0> {}

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

    public mut static prop NewParent_MutStaticMemberProperty: Int64 {
        get() {
            println("NewParent<?>.NewParent_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("NewParent<?>.NewParent_MutStaticMemberProperty")
        }
    }
}

extend<T0> UpStreamChild<T0> <: NewParent<Float64> {}

public func checkParent<F0>(i: UpStreamParent<F0>): Unit {
    var instance = i
    instance.UpStreamParent_instanceMemberFunction()
    instance.UpStreamParent_instanceMemberProperty
    UpStreamParent<F0>.UpStreamParent_staticMemberFunction()
    UpStreamParent<F0>.UpStreamParent_staticMemberProperty
}

public func checkChild<F0>(i: UpStreamChild<F0>): Unit {
    var instance = i
}

public func checkStatic<P, T0>(): Unit where P <: UpStreamParent<T0> {
    P.UpStreamParent_staticMemberFunction()
    P.UpStreamParent_staticMemberProperty
}
