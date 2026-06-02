// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package p1

public func foo(param!: Int64 = 0) {
    let a = Array<Int64>(1000) {i => i + 1}
    for (i in 0..10) {
        a[i] = a[i] * a[i] - 4
    }
    println(a[10])
    return param - a.size
}
