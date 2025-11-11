/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

let M = Float16.NaN
main() {
    let r1 = { a: Float16 => a }(M)
    if (r1 != Float16.NaN) {
        println(r1)
    }
 
    if (Float16.NaN == r1) {
        println(r1)
    }
    0
}
