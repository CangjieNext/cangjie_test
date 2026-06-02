/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class C1{
    var a = 1
    var b = 2
}

enum E1{
    A| B
}

func test1(){
    let a1 = [(C1().a, E1.A), (C1().b, E1.B)]
    for ((x, y) in a1) {
        println("${x}")
    }
}

main() {
    test1()
    0
}
