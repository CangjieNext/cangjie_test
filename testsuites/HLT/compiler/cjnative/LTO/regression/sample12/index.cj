// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
VFE，全部都是成员属性
 */
package model_lto.sample12

import std.runtime.*

interface I1<T> {
    prop func_I11: Unit {
        get() {
            println("===")
        }
    }
    prop func_I12: Unit {
        get() {
            println("===")
        }
    }
    prop func_I13: Unit {
        get() {
            println("===")
        }
    }
}

interface I2<T> {
    prop func_I21: Unit {
        get() {
            println("===")
        }
    }
    prop func_I22: Unit {
        get() {
            println("===")
        }
    }
    prop func_I23: Unit {
        get() {
            println("===")
        }
    }
}

interface I3<T> {
    prop func_I31: Unit {
        get() {
            println("===")
        }
    }
    prop func_I32: Unit {
        get() {
            println("===")
        }
    }
    prop func_I33: Unit {
        get() {
            println("===")
        }
    }
}

// 父类型多多益善
class A<T> <: I1<T> & I2<I1<T>> & I3<I1<I3<Int64>>> {
    public prop func_I1: Unit {
        get() {
            println("===")
        }
    }
    public prop func_I22: Unit {
        get() {
            println("===")
        }
    }
}

func call_I2_1<T>(v: I2<I1<T>>) {
    v.func_I22
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
    println("========")
    println("========")
    println("========")
    println("========")
    println("========")
}

// user函数形参列表变异
func call_I2_2<T>(v: I2<I1<Int64>>) {
    v.func_I22
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

public func entry1(): Unit {
    let v = A<Int64>()
    blackBox(call_I2_1<Int64>(v))
    blackBox(call_I2_2<Int64>(v))
}

main(): Unit {
    entry1()
    println("pass")
}
