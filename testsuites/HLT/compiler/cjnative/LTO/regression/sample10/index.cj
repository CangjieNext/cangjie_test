// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

/*
phi分支，for
 */
package model_lto.sample10

import std.runtime.*
import std.math.*
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

// match enum
public func test3<T>(p0: S0<T>, p1: S0<T>, p2: Array<T>): S0<T> {
    let v0: S0<T> = p0
    var res: S0<T> = p0
    for (_ in p2) {
        for (_ in p2) {
            for (_ in p2) {
                for (_ in p2) {
                    for (_ in p2) {
                        for (_ in p2) {
                            for (_ in p2) {
                                res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                                    let v2: S0<T> = v0
                                    // 新增bb以增加复杂度
                                    clobber<S0<T>>(v2)
                                    res = v2
                                    break
                                } else {
                                    let v3: S0<T> = p1
                                    res = v3
                                    break
                                }
                            }
                            res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                                let v2: S0<T> = v0
                                // 新增bb以增加复杂度
                                clobber<S0<T>>(v2)
                                res = v2
                                break
                            } else {
                                let v3: S0<T> = p1
                                res = v3
                                break
                            }
                        }
                        res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                            let v2: S0<T> = v0
                            // 新增bb以增加复杂度
                            clobber<S0<T>>(v2)
                            res = v2
                            break
                        } else {
                            let v3: S0<T> = p1
                            res = v3
                            break
                        }
                    }
                    res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                        let v2: S0<T> = v0
                        // 新增bb以增加复杂度
                        clobber<S0<T>>(v2)
                        res = v2
                        break
                    } else {
                        let v3: S0<T> = p1
                        res = v3
                        break
                    }
                }
                res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                    let v2: S0<T> = v0
                    // 新增bb以增加复杂度
                    clobber<S0<T>>(v2)
                    res = v2
                    break
                } else {
                    let v3: S0<T> = p1
                    res = v3
                    break
                }
            }
            res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
                let v2: S0<T> = v0
                // 新增bb以增加复杂度
                clobber<S0<T>>(v2)
                res = v2
                break
            } else {
                let v3: S0<T> = p1
                res = v3
                break
            }
        }
        res = if (Random(UInt64(DateTime.now().second)).nextBool()) {
            let v2: S0<T> = v0
            // 新增bb以增加复杂度
            clobber<S0<T>>(v2)
            res = v2
            break
        } else {
            let v3: S0<T> = p1
            res = v3
            break
        }
    }
    res
}

main(): Unit {
    test3<Int64>(S0<Int64>(1), S0<Int64>(1),
        Array<Int64>(abs(Random(UInt64(DateTime.now().second)).nextInt64(3)), repeat: 1))
    gc(heavy: true)
    println("pass")
}
