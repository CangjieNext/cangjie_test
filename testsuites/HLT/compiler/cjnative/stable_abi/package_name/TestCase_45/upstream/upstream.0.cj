/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package com::pkga

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

public open class UpStreamChild<T0> <: UpStreamParent<T0> {
    public open func New_OpenInstanceMemberFunction(): Unit {
        println("UpStreamChild<${TypeInfo.of<T0>()}>.New_OpenInstanceMemberFunction")
    }

    public static func New_StaticMemberFunction(): Unit {
        println("UpStreamChild<${TypeInfo.of<T0>()}>.New_StaticMemberFunction")
    }

    public open mut prop New_MutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamChild<${TypeInfo.of<T0>()}>.New_MutInstanceMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamChild<${TypeInfo.of<T0>()}>.New_MutInstanceMemberProperty")
        }
    }

    public open prop New_NonMutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamChild<${TypeInfo.of<T0>()}>.New_NonMutInstanceMemberProperty")
            114514i64
        }
    }

    public static prop New_NonMutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamChild<?>.New_NonMutStaticMemberProperty")
            114514i64
        }
    }

    public static mut prop New_MutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamChild<?>.New_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamChild<?>.New_MutStaticMemberProperty")
        }
    }
}

public func checkParent<F0>(i: UpStreamParent<F0>): Unit {
    var instance = i
    instance.UpStreamParent_instanceMemberFunction()
    instance.UpStreamParent_instanceMemberProperty
    UpStreamParent<F0>.UpStreamParent_staticMemberFunction()
    UpStreamParent<F0>.UpStreamParent_staticMemberProperty
}

public func checkChild<F0>(i: UpStreamChild<F0>): Unit {
    var instance = i
    instance.New_OpenInstanceMemberFunction()
    instance.New_MutInstanceMemberProperty
    instance.New_MutInstanceMemberProperty = 1i64
    instance.New_NonMutInstanceMemberProperty
    UpStreamChild<F0>.New_StaticMemberFunction()
    UpStreamChild<F0>.New_NonMutStaticMemberProperty
    UpStreamChild<F0>.New_MutStaticMemberProperty
    UpStreamChild<F0>.New_MutStaticMemberProperty = 1i64
}

public func checkStatic<P, T0>(): Unit where P <: UpStreamParent<T0> {
    P.UpStreamParent_staticMemberFunction()
    P.UpStreamParent_staticMemberProperty
}
