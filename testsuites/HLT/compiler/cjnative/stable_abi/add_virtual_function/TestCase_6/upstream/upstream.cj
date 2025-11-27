/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package upstream

import std.reflect.*

public interface UpStreamParent<T0> {
    func UpStreamParent_NonMutInstanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_NonMutInstanceMemberFunction")
    }

    mut func UpStreamParent_MutInstanceMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_MutInstanceMemberFunction")
    }

    static func UpStreamParent_staticMemberFunction(): Unit {
        println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_staticMemberFunction")
    }

    prop UpStreamParent_NonMutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_NonMutInstanceMemberProperty")
            114514i64
        }
    }

    mut prop UpStreamParent_MutInstanceMemberProperty: Int64 {
        get() {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_MutInstanceMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamParent<${TypeInfo.of<T0>()}>.UpStreamParent_MutInstanceMemberProperty")
        }
    }

    static prop UpStreamParent_NonMutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?>.UpStreamParent_NonMutStaticMemberProperty")
            114514i64
        }
    }

    mut static prop UpStreamParent_MutStaticMemberProperty: Int64 {
        get() {
            println("UpStreamParent<?>.UpStreamParent_MutStaticMemberProperty")
            114514i64
        }
        set(v) {
            println("UpStreamParent<?>.UpStreamParent_MutStaticMemberProperty")
        }
    }
}

public struct UpStreamChild<T0> <: UpStreamParent<T0> {}

public func checkParent<F0>(i: UpStreamParent<F0>): Unit {
    var instance = i
    instance.UpStreamParent_NonMutInstanceMemberFunction()
    instance.UpStreamParent_MutInstanceMemberFunction()
    instance.UpStreamParent_NonMutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty = 1i64
    UpStreamParent<F0>.UpStreamParent_staticMemberFunction()
    UpStreamParent<F0>.UpStreamParent_NonMutStaticMemberProperty
    UpStreamParent<F0>.UpStreamParent_MutStaticMemberProperty
    UpStreamParent<F0>.UpStreamParent_MutStaticMemberProperty = 1i64
}

public func checkChild<F0>(i: UpStreamChild<F0>): Unit {
    var instance = i
    instance.UpStreamParent_NonMutInstanceMemberFunction()
    instance.UpStreamParent_MutInstanceMemberFunction()
    UpStreamChild<F0>.UpStreamParent_staticMemberFunction()
    instance.UpStreamParent_NonMutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty
    instance.UpStreamParent_MutInstanceMemberProperty = 1i64
    UpStreamChild<F0>.UpStreamParent_NonMutStaticMemberProperty
    UpStreamChild<F0>.UpStreamParent_MutStaticMemberProperty
    UpStreamChild<F0>.UpStreamParent_MutStaticMemberProperty = 1i64
}

public func checkStatic<P, T0>(): Unit where P <: UpStreamParent<T0> {
    P.UpStreamParent_staticMemberFunction()
    P.UpStreamParent_NonMutStaticMemberProperty
    P.UpStreamParent_MutStaticMemberProperty
    P.UpStreamParent_MutStaticMemberProperty = 1i64
}
