/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

main() {
    let M = Float32.NaN
    let r1 = { a: Float32 => a }(M)
    if (r1 != Float32.NaN) {
        println(r1)
    }
 
    if (Float32.NaN == r1) {
        println(r1)
    }
    0
}
