class Rectangle {
    public static let degree: Float32
    static init() {
        degree = { a: Float32 => a }(0x.1p1 * 1.0)
    }
}

main() {
    if (Rectangle.degree != Float32.NaN) {
        println(Rectangle.degree)
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
