/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func compute(x: Int64): Int64 {
    return x * 2
}

func run(tag: String, x: Int64): Int64 {
    println(tag)
    return compute(1)
}

main() {
    let r = run("go", 5)
    println(r)
}
