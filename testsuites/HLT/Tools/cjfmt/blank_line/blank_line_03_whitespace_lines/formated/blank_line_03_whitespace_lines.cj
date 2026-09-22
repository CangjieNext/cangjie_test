/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(): Int64 {
    let a = 1

    let b = 2

    return a + b
}

class W {
    let v: Int64 = 1

    let w: Int64 = 2
}

main() {
    println(f())
    println(W().v)
}
