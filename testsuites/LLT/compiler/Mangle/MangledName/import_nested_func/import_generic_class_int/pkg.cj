// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class A<T> {
    public func f() {
        func g() {
            0
        }
        g
    }

    public func f(_: Int64) {
        func g() {
            1
        }
        g
    }
}
