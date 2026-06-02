// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample4

import std.runtime.*

public interface I0<T> {
    func func_I11() {}
    func func_I12() {}
    func func_I13() {}
}

public interface I1<T> {
    func func_I21() {}
    func func_I22() {}
    func func_I23() {}
}

public interface I2<T> {
    func func_I31() {}
    func func_I32() {}
    func func_I33() {}
}

public open class OC0 {}

public abstract class AC0 {}

// 父类型多多益善
class A<T> <: I0<T> & I1<I0<T>> & I2<I0<I2<Int64>>> {
    public func func_I1() {}
    public func func_I22() {
    }
}

func call_I2_1<T>(v: I1<I0<T>>) {
    v.func_I22()
}

// user函数形参列表变异
func call_I2_2<T>(v: I1<I0<Int64>>) {
    v.func_I22()
}

public func entry1(): Unit {
    let v = A<Int64>()
    call_I2_1<Int64>(v)
}

main() {
    entry1()
    gc(heavy: true)
    gc(heavy: false)
    println("pass")
}
