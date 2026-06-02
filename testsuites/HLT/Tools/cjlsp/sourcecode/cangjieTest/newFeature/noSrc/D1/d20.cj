/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

type IIIIIII64 = Int64
type PP = (Float64, Float64)
let p1: PP = (1.0, 2.0)

func test37(): Int64 {
    let a: IIIIIII64 = 3
    let b: Int64 = 24
    let c = a + b
    print("a + b = ${c}")
    return 0
}
