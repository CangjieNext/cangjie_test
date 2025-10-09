// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package cj

/**
 * Testing scenarios where exceptions are indirectly thrown 
 */

import interoplib.interop.*
import java.lang.*

func globalHello() {
    throw ArithmeticException("ArithmeticException in global func")
}

@JavaImpl
public class Impl <: MyObject {
    public override func hello(): Unit {
        super.hello()
    }

    public func hello2(): Unit {
        globalHello()
    }
}

public struct Impl2 {
    public func foo(mo: MyObject): Unit {
        mo.hello()
    }

    public func foo(impl: Impl): Unit {
        impl.hello()
    }
}

