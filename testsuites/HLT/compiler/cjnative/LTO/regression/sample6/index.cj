// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
phi分支，if-else
 */
package model_lto.sample6

import std.runtime.*
import std.random.*
import std.time.*

public var sinkAny: Any = 0

public func clobber<T>(x: T) {
    sinkAny = x
}

public enum E0<T> {
    | A(T)
    | B(T, T)
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
    // 双头if表达式
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

// if-let
public func test2<T>(p0: S0<T>, p1: S0<T>, p2: ?Int64): S0<T> {
    let v0: S0<T> = p0
    let v1: S0<T> = if (let Some(v) <- p2) {
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

// match enum
public func test3<T>(p0: S0<T>, p1: S0<T>, p2: E0<T>): S0<T> {
    let v0: S0<T> = p0
    let v1: S0<T> = match (p2) {
        // where增加复杂度
        case E0.A(_v) where _v is Int64 =>
            let v2: S0<T> = v0
            // 新增bb以增加复杂度
            clobber<S0<T>>(v2)
            v2
        case E0.B(_, _) =>
            let v3: S0<T> = p1
            v3
        // 通配符增加复杂度
        case _ =>
            let v2: S0<T> = v0
            // 新增bb以增加复杂度
            clobber<S0<T>>(v2)
            v2
    }
    v1
}

main(): Unit {
    test0<Int64>(S0<Int64>(1), S0<Int64>(1), Random(UInt64(DateTime.now().second)).nextBool())
    test1<Int64>(S1<Int64>(C0<Int64>(1), 1), S1<Int64>(C0<Int64>(1), 1),
        Random(UInt64(DateTime.now().second)).nextBool(), Random(UInt64(DateTime.now().second)).nextBool())
    test2<Int64>(S0<Int64>(1), S0<Int64>(1), if (Random(UInt64(DateTime.now().second)).nextBool()) {
        Some(1)
    } else {
        None
    })
    test3<Int64>(S0<Int64>(1), S0<Int64>(1), if (Random(UInt64(DateTime.now().second)).nextBool()) {
        E0<Int64>.A(1)
    } else {
        E0<Int64>.B(1, 2)
    })
    gc(heavy: true)
    println("pass 6")
}
