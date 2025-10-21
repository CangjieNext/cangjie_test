/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Type

type Int1 = Int32
let n1: Int1 = 2
let n2: Int32 = 3

let n3 = n1 + n2

func add(a: Int1, b: Int32): Int32 {
    a + b
}

func add(a: Int1, b: Int32, cdab!: Int1 = 1): Int1 {
    a + b + cdab
}
