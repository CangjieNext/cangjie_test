/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.ClassInitPara

class C10 {
    C10(
        a: Int32,
        fn: (Int32) -> Int32,
        var b: Int64,
        var c!: Bool = true
    ) {}
    init(a: Int32, fn: (Int32) -> Int32) {
        b = 1
        c = false
    }
}

var l1 = C10(1, {i => i * 6}, 2)
var l2 = C10(1, {i => i})
var l3 = l2.c
