/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func f(): Float64 {
    var acc = 0.0
    var i = 0
    while (i < 10) {
        acc += 0.1
        i += 1
    }
    return acc
}

main() {
    println(f())
}
