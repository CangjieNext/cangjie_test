/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Rectangle {
    public let degree: Float32 = 0x.1 * 1.0
}

main() {
    var r = Rectangle()
    if (r.degree != Float32.NaN) {
        println(r.degree)
    }
    0
}
