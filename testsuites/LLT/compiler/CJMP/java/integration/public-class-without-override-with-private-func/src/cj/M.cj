// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

import interoplib.interop.*

public class M {
    public init() {}

    public func goo(className: Int32): Unit {
        println("in M goo, Call from ${className}")
    }

    public func objectRet(): M {
        println("in M objectRet")
        let res = M()
        return res
    }

    public static func staticFunc(a: Int32): Unit {
        println("in M staticFunc, Call from ${a}")
    }

    private func privateFunc(): Unit {
        println("in M privateFunc")
    }
}