/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func compare(x: Float64): Bool {
    if (x == 3.14) {
        return true
    }
    return false
}

func precision() {
    if (0.1 + 0.2 == 0.3) {
        println("equal")
    }
}

main() {
    println(compare(3.14))
    precision()
}
