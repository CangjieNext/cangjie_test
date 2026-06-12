// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample5

import std.collection.*
import std.runtime.*

public struct S0<T> {
    public var v: T
    public init(v: T) {
        this.v = v
    }
}

public struct S1<T> {
    public var v: S0<T>
    public init(v: S0<T>) {
        this.v = v
    }
}

public struct S2<T> {
    public var v: S1<T>
    public init(v: S1<T>) {
        this.v = v
    }
}

public struct S3<T> {
    public var v: S2<T>
    public init(v: S2<T>) {
        this.v = v
    }
}

/*
spawn 后进行读操作
 */
public func test<T>(x: S3<T>) {
    let arr = ArrayList<Future<T>>()
    let scale = 10000
    for (_ in 0..scale) {
        let f = spawn {
            var t0 = x.v
            var t1 = t0.v
            var t2 = t1.v
            var t3 = t2.v
            t3
        }
        arr.add(f)
    }
    for (f in arr) {
        f.get()
    }
}

/*
非spawn，读写操作交叉进行
 */
public func test1<T>(_x: S3<T>): ArrayList<T> {
    var x = _x
    let scale = 10000
    let arr = ArrayList<T>()
    for (_ in 0..scale) {
        var t0 = x.v
        x.v = t0
        var t1 = t0.v
        t0.v = t1
        var t2 = t1.v
        t1.v = t2
        var t3 = t2.v
        for (_ in 0..scale) {
            t2.v = t3
            t0 = x.v
            x.v = t0
            t2.v = t3
            t0.v = t1
            t1 = t0.v
            t2 = t1.v
            t3 = t2.v
            t1.v = t2
        }
        arr.add(t3)
    }
    arr
}

public class C0<T> <: I0<T> {}

public struct S4<T> {}

public interface I0<T> {}

main(): Unit {
    // 开局spawn一个线程专门不断进行gc
    spawn {
        while (true) {
            gc(heavy: true)
        }
    }
    // 基础数据类型
    blackBox(test<Int64>(S3<Int64>(S2<Int64>(S1<Int64>(S0<Int64>(1))))))
    blackBox(test1<Int64>(S3<Int64>(S2<Int64>(S1<Int64>(S0<Int64>(1))))))
    // TODO:
    // class
    blackBox(
        test<C0<C0<Int64>>>(S3<C0<C0<Int64>>>(S2<C0<C0<Int64>>>(S1<C0<C0<Int64>>>(S0<C0<C0<Int64>>>(C0<C0<Int64>>()))))))
    blackBox(
        test<C0<C0<Int64>>>(S3<C0<C0<Int64>>>(S2<C0<C0<Int64>>>(S1<C0<C0<Int64>>>(S0<C0<C0<Int64>>>(C0<C0<Int64>>()))))))
    // struct
    blackBox(
        test<S4<S4<Int64>>>(S3<S4<S4<Int64>>>(S2<S4<S4<Int64>>>(S1<S4<S4<Int64>>>(S0<S4<S4<Int64>>>(S4<S4<Int64>>()))))))
    blackBox(
        test<S4<S4<Int64>>>(S3<S4<S4<Int64>>>(S2<S4<S4<Int64>>>(S1<S4<S4<Int64>>>(S0<S4<S4<Int64>>>(S4<S4<Int64>>()))))))
    // interface
    blackBox(
        test<S4<S4<Int64>>>(S3<S4<S4<Int64>>>(S2<S4<S4<Int64>>>(S1<S4<S4<Int64>>>(S0<S4<S4<Int64>>>(S4<S4<Int64>>()))))))
    blackBox(
        test<I0<I0<Int64>>>(S3<I0<I0<Int64>>>(S2<I0<I0<Int64>>>(S1<I0<I0<Int64>>>(S0<I0<I0<Int64>>>(C0<I0<Int64>>()))))))
    gc(heavy: true)
    println("pass")
}
