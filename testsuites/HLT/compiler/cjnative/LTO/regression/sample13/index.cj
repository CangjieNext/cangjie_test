// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample13

import std.runtime.*
import std.random.*

struct S0<T0> {
    var v: T0

    init(v: T0) {
        this.v = v
    }
}

struct S1<T0> {
    var v: S0<T0>

    init(v: S0<T0>) {
        this.v = v
    }
}

struct S2<T0> {
    var v: S1<T0>

    init(v: S1<T0>) {
        this.v = v
    }
}

struct S3<T0> {
    var v: S2<T0>

    init(v: S2<T0>) {
        this.v = v
    }
}

public interface I0<T0> {
    func func_I0_0(): Unit {
        println("I0.func_I0_0")
    }

    func func_I0_1(): Unit

    func func_I0_2(): Unit
}

public interface I1<T0> {
    func func_I1_0(): Unit

    func func_I1_1(): Unit

    func func_I1_2(): Unit
}

public interface I2<T0> {
    func func_I2_0(): Unit

    func func_I2_1(): Unit {
        println("I2.func_I2_1")
    }

    func func_I2_2(): Unit
}

public class C<T0> <: I0<I1<I0<I0<I2<I1<I2<I1<I0<Int64>>>>>>>>> & I1<I1<I0<I2<I0<T0>>>>> & I2<I2<I1<I1<I1<I2<I0<I2<I0<I2<Int64>>>>>>>>>> {
    public func func_I0_0(): Unit {
        println("C.func_I0_0")
    }

    public func func_I0_1(): Unit {
        println("C.func_I0_1")
    }

    public func func_I0_2(): Unit {
        println("C.func_I0_2")
    }

    public func func_I1_0(): Unit {
        println("C.func_I1_0")
    }

    public func func_I1_1(): Unit {
        println("C.func_I1_1")
    }

    public func func_I1_2(): Unit {
        println("C.func_I1_2")
    }

    public func func_I2_0(): Unit {
        println("C.func_I2_0")
    }

    public func func_I2_1(): Unit {
        println("C.func_I2_1")
    }

    public func func_I2_2(): Unit {
        println("C.func_I2_2")
    }
}

public func f_I0<T0>(instance: I0<T0>): Unit {
    instance.func_I0_0()
    instance.func_I0_1()
    instance.func_I0_2()
    println("=======")
    println("=======")
    println("=======")
    println("=======")
}

public func f_I1<T0>(instance: I1<T0>): Unit {
    instance.func_I1_2()
    println("=======")
    println("=======")
    println("=======")
    println("=======")
}

public func f_I2<T0>(instance: I2<T0>): Unit {
    instance.func_I2_1()
    instance.func_I2_2()
    println("=======")
    println("=======")
    println("=======")
    println("=======")
}

func testGcReadGcWrite<T0>() {
    if (Random().nextBool()) {
        var s = S3<Int64>(S2<Int64>(S1<Int64>(S0<Int64>(1i64))))
        var t1 = s.v
        var t2 = t1.v
        var t3 = t2.v
        var t4 = t3.v
        s.v = t1
        t1.v = t2
        t2.v = t3
        t3.v = t4
        t1 = s.v
        t2 = t1.v
        t3 = t2.v
        t4 = t3.v
        println("true")
    } else {
        var s = S3<Int64>(S2<Int64>(S1<Int64>(S0<Int64>(1i64))))
        var t1 = s.v
        var t2 = t1.v
        var t3 = t2.v
        var t4 = t3.v
        s.v = t1
        t1.v = t2
        t2.v = t3
        t3.v = t4
        t1 = s.v
        t2 = t1.v
        t3 = t2.v
        t4 = t3.v
        println("false")
    }
}

main(): Unit {
    blackBox(f_I0(C<Int64>()))
    blackBox(f_I1(C<Int64>()))
    blackBox(f_I2(C<Int64>()))
    testGcReadGcWrite<Int64>()
    gc(heavy: true)
}
