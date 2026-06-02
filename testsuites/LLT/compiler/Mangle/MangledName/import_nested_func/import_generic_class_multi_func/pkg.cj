// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public class A<T> {
    public func k(_: Int64) {
        func f(_: Int64) {
            func g(_: Int64) {
                false
            }
            g
        }
        f
    }

    public func k() {
        func f(_: Int64, _: Int64) {
            func g() {
                1
            }
            g
        }
        f
    }
}
