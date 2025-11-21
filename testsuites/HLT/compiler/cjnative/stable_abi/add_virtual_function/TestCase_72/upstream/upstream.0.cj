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

    public open func New_OpenInstanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.New_OpenInstanceMemberFunction")
    }

    public static func New_StaticMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.New_StaticMemberFunction")
    }

    public mut open prop New_MutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.New_MutInstanceMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.New_MutInstanceMemberProperty")
        }
    }

    public open prop New_NonMutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.New_NonMutInstanceMemberProperty")
            114514i64
        }
    }

    public static prop New_NonMutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?>.New_NonMutStaticMemberProperty")
            114514i64
        }
    }

    public mut static prop New_MutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?>.New_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamParent<?>.New_MutStaticMemberProperty")
        }
    }
}

public open class UpStreamChild<T0> <: UpStreamParent<T0> {}

public func checkParent<F0>(i: UpStreamParent<F0>): Unit {
    var instance = i
    instance.UpStreamParent_instanceMemberFunction()
    instance.New_OpenInstanceMemberFunction()
    instance.UpStreamParent_instanceMemberProperty
    instance.New_MutInstanceMemberProperty
    instance.New_MutInstanceMemberProperty = 1i64
    instance.New_NonMutInstanceMemberProperty
    UpStreamParent<F0>.UpStreamParent_staticMemberFunction()
    UpStreamParent<F0>.New_StaticMemberFunction()
    UpStreamParent<F0>.UpStreamParent_staticMemberProperty
    UpStreamParent<F0>.New_NonMutStaticMemberProperty
    UpStreamParent<F0>.New_MutStaticMemberProperty
    UpStreamParent<F0>.New_MutStaticMemberProperty = 1i64
}

public func checkChild<F0>(i: UpStreamChild<F0>): Unit {
    var instance = i
}

public func checkStatic<P, T0>(): Unit where P <: UpStreamParent<T0> {
    P.UpStreamParent_staticMemberFunction()
    P.New_StaticMemberFunction()
    P.UpStreamParent_staticMemberProperty
    P.New_NonMutStaticMemberProperty
    P.New_MutStaticMemberProperty
    P.New_MutStaticMemberProperty = 1i64
}
