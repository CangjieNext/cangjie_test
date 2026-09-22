/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func interp(a: Int64, b: Int64): Unit {
    println(
        "prefix part ${a + b} suffix part that makes this string very long beyond the limit of one hundred and twenty chars in total length ${a * b} tail")
}

main() {
    interp(3, 4)
}
