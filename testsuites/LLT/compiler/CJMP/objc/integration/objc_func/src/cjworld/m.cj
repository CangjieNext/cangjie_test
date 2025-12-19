// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cjworld

import objc.lang.*

@ObjCMirror
public open class NSObject {
    public init()
}

@ObjCImpl
public class K <: NSObject {
    let fp: ObjCFunc<(Float64) -> Float64>
    mut prop fProp: ObjCFunc<(Float64) -> Float64> {
        get() { M().fPtr() }
        set(x) {}
    }

    public init() {
        super()
        fp = M().fPtr()
    }

    @ForeignName["mapF:"]
    public func mapF(f: ObjCFunc<(Float64) -> Float64>): Float64 {
        return f.call(3.14)
    }
}

@ObjCImpl
public class L <: NSObject {
    public init() {
        super()
    }

    @ForeignName["returnF:"]
    public func returnF(f: ObjCFunc<(Float64) -> Float64>): ObjCFunc<(Float64) -> Float64> {
        return f
    }
}

@ObjCMirror
public class N {
    public init()
    @ForeignName["mapF:"]
    public func mapF(f: ObjCFunc<(Float64) -> Float64>): Float64
    @ForeignName["letF:"]
    public func letF(f: ObjCFunc<(N) -> N>): N
    public func id(): Int64
}

@ObjCMirror
public open class M {
    public init()
    public func fPtr(): ObjCFunc<(Float64) -> Float64>
    public func iPtr(): ObjCFunc<(Float64) -> Float64>
    public func makeK(): K
    public func makeNFunc(): ObjCFunc<(N) -> N>
}
