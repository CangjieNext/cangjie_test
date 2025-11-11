// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

public struct Vector {
    private var x: Int32 = 0
    private var y: Int32 = 0

    public init(x: Int32, y: Int32) {
        this.x = x
        this.y = y
    }

    private func dot(v: Vector): Int64 {
        let res: Int64 = Int64(x * v.x  + y * v.y)
        print("cj: Hello from dot (${x}, ${y}) . (${v.x}, ${v.y}) = ${res}\n", flush: true)
        return res;
    }

    public func add(v: Vector): Vector {
       let res = Vector(x + v.x, y + v.y)
       print("cj: Hello from add (${x}, ${y}) + (${v.x}, ${v.y}), new Vector = (${res.x}, ${res.y})\n", flush: true)
       return res
    }
}