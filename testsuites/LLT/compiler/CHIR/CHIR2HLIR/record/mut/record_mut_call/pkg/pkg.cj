// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package pkg

public struct happy<T> {
    private var num: Int32 = 0

    public func sayHi() {
        print("hi!\n")
    }

    public mut func sayHi(a: Int32) {
        print("hi! nums!\n")
    }

    public operator func +(offset: Int64): happy<T> {
        return this
    }

    public operator func -(offset: Int64): happy<T> {
        return this
    }
}
