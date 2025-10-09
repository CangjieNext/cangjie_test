let r1: Float64 = 0x.1p1 * 1.0
main() {
    if (r1 != Float64.NaN) {
        println(r1 * 2.0)
    }
 
    if (Float64.NaN == r1) {
        println(r1 * 2.0)
    }
    0
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
