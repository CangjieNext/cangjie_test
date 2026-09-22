/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func calc(a: Int64, b: Int64): Int64 {
    return a + b
}

func show(): Unit {
    let i = 1
    let j = 2
    let arr = [10, 20]
    let s1 = "product=${i * j}"
    let s2 = "ref=${arr[0]}"
    let s3 = "nested=${calc(3, 4)}"
    println(s1)
    println(s2)
    println(s3)
}

main() {
    show()
}
