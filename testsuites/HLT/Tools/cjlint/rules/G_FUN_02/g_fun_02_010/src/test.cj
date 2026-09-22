/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func draw(shape: String): Unit {
    println(shape)
}

func draw(shape: String, scale: Int64): Unit {
    println(shape)
}

main() {
    draw("circle")
    draw("square", 2)
}
