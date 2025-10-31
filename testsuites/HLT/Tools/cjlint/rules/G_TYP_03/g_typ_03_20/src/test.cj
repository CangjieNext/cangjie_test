/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

struct Rectangle {
    public static let degree: Float64
    static init() {
        degree = { a: Float64 => a }(-0x.1p2)
    }
}

main() {
    if (Rectangle.degree != Float64.NaN) {
        println(Rectangle.degree)
    }
    0
}
