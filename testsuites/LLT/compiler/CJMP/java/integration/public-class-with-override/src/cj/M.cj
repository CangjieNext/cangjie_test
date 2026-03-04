// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj
import interoplib.interop.*

public open class M {
    public init() {
        
    }

    public init(a: Int32, b: Int64) {
        print("in M init(a,b), a=${a}, b = ${b}\n", flush: true)
    }

    public open func foo(): Unit {
        print("in M foo().\n", flush: true)
    }

    protected open func goo(a: Int32): Float64 {
        print("in M goo(), a=${a}.\n", flush: true)
        return 6.0
    }

    public open func dog(a: Int32, b: Int32, c: Int16, d: Float32): Int64 {
        print("in M dog(), a=${a}, b=${b}, c=${c}, d=${d}.\n", flush: true)
        return 7
    }
}
