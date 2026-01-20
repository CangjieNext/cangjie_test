/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func foo() {
    func nestAdd(a: Int64, b: Int64) {
        var sum = 0
        for (i in 1..=100) {
            sum += i
        }
        a + b + 3
    }

    println(nestAdd(1, 2))
    return nestAdd
}

main() {
    let f = foo()
    let x = f(1, 2)
    println("result: ${x}")
}
