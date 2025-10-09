// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

package test.aoo

internal import pro1.xoo.*
internal import pro1.yoo.*

public func aaa() {
    let size = x + y
    var res = 0
    for (i in 0..size) {
        res += i * i
    }
    println(res)
    return
}
