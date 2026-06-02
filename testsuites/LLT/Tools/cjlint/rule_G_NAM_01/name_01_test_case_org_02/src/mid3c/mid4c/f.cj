// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package org::mid3c.mid4c

open class SubD {
    public open func foo1(): Unit {
        var a = 1
        if (a == 1) {
            print("SubD: open foo1")
        }
    }
    public open func foo2(): Unit {}
}