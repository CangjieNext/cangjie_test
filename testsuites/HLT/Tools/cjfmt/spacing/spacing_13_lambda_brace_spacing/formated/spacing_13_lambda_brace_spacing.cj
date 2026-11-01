/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func show(): Unit {
    let f1 = {x => x + 1}
    let f2 = {x => x * 2}
    let f3 = {x: Int64, y: Int64 => x + y}
    println(f1(1))
    println(f2(2))
    println(f3(3, 4))
}

main() {
    show()
}
