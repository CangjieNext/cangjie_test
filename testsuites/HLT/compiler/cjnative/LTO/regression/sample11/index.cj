// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
成员函数和成员属性混杂，同时存在
 */
package model_lto.sample11

import std.runtime.*

interface I1<T> {
    func func_I11() {}
    func func_I12() {}
    func func_I13() {}
    prop prop_I11: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I12: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I13: Unit {
        get() {
            println("===")
        }
    }
}

interface I2<T> {
    func func_I21() {}
    func func_I22() {}
    func func_I23() {}
    prop prop_I21: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I22: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I23: Unit {
        get() {
            println("===")
        }
    }
}

interface I3<T> {
    func func_I31() {}
    func func_I32() {
        println("func_I32")
    }
    func func_I33() {}
    prop prop_I31: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I32: Unit {
        get() {
            println("===")
        }
    }
    prop prop_I33: Unit {
        get() {
            println("===")
        }
    }
}

public abstract class AC<T> {
    public func func_AC1(): Unit
    public func func_AC2(): Unit
    public func func_AC3(): Unit {}
    public func func_AC4(): Unit
    public func func_AC5(): Unit {}
}

public open class OC<T> {
    public func func_OC1(): Unit {
    }
    public func func_OC2(): Unit {
    }
}

// 父类型多多益善
class A<T> <: AC<OC<AC<OC<AC<I1<I2<T>>>>>>> & I1<T> & I2<I1<T>> & I3<I1<I3<C0<Int64>>>> {
    public func func_I1() {}
    public func func_I22() {}
    public func func_AC1(): Unit {
    }
    public func func_AC2(): Unit {
        println("func_AC2")
    }
    public func func_AC4(): Unit {
    }
    public prop prop_I11: Unit {
        get() {
            println("===")
        }
    }
    public prop prop_I22: Unit {
        get() {
            println("===")
        }
    }
    public prop prop_I33: Unit {
        get() {
            println("===")
        }
    }
}

func call_I2_1<T>(v: I2<I1<T>>) {
    v.func_I22()
    v.prop_I22
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
}

func call_I3<T>(v: I3<I1<I3<T>>>) {
    v.func_I32()
    v.prop_I33
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
}

// user函数形参列表变异
func call_I2_2<T>(v: I2<I1<Int64>>) {
    v.func_I22()
    v.prop_I23
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
}

func call_AC<T>(v: AC<OC<T>>) {
    v.func_AC2()
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
}

public class C0<T> {}

public func entry1(): Unit {
    let v = A<Int64>()
    blackBox(call_I2_1<Int64>(v))
    blackBox(call_I2_2<Int64>(v))
    call_AC<AC<OC<AC<I1<I2<Int64>>>>>>(A())
    // call_I3<Int64>(A<Int64>())
    call_I3<C0<Int64>>(A<C0<Int64>>())
}

main(): Unit {
    entry1()
    println("pass")
}
