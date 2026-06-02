// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package model_lto.sample1

public var sinkAny: Any = 0

public func clobber<T>(x: T) {
    sinkAny = x
}

public class C0<T> {
    public var v: T
    public init(v: T) {
        this.v = v
    }
}

public struct S0<T> {
    public let v: T
    public init(v: T) {
        this.v = v
    }
}

public struct S1<T> {
    public let v0: C0<T>
    public let v1: T
    public init(v0: C0<T>, v1: T) {
        this.v0 = v0
        this.v1 = v1
    }
}

public func test0<T>(p0: S0<T>, p1: S0<T>, p2: Bool): S0<T> {
    let v0: S0<T> = p0
    let v1: S0<T> = if (p2) {
        let v2: S0<T> = v0
        // 新增bb以增加复杂度
        clobber<S0<T>>(v2)
        v2
    } else {
        let v3: S0<T> = p1
        v3
    }
    v1
}

public func test1<T>(p0: S1<T>, p1: S1<T>, p2: Bool, p3: Bool): Unit {
    let v0: S1<T> = if (p2) {
        let v1: S1<T> = p0
        clobber<S1<T>>(v1)
        v1
    } else {
        p1
    }
    // struct复制
    let v2: S1<T> = v0
    if (p3) {
        let v3: T = v2.v1
        // struct写
        p0.v0.v = v3
    }
}

main(): Unit {
    test0<Int64>(S0<Int64>(1), S0<Int64>(1), true)
    test1<Int64>(S1<Int64>(C0<Int64>(1), 1), S1<Int64>(C0<Int64>(1), 1), true, false)
    println("pass")
}
