// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

internal import aoo.*
internal import boo.*
internal import xoo.*
internal import yoo.*
internal import zoo.*

main(): Int64 {
    let a = one
    let b = two
    let e = x
    let f = y
    let g = z
    let res = a + b
    let res2 = e + f + g
    if (res != 3 || res2 != 101) {
        return 1
    }
    return 0
}
