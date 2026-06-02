// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public open class A {
    public var a: Int32 = 1
    public mut prop m: Int32 {
        get() {
            return (a)
        }
        set(input) {
            a = input + 1
        }
    }
}

public class B <: A {}
