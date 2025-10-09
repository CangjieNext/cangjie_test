// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import aoo.*
internal import boo.*

let gVar: String = "123"

main(): Int64 {
    let a = aoo.one
    let b = boo.two
    let res = a + b
    println(gVar)
    if (res != 3) {
        return 1
    }
    return 0
}
