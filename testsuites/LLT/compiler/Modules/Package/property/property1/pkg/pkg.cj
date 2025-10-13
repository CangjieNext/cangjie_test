// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public open class AAA {
    public var x: Int64 = 2
    public mut open prop i1: Int64 {
        get() {
            return x
        }
        set(v) {
            x = v
        }
    }
}
