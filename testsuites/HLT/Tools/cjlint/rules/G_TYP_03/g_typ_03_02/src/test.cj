/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Rectangle {
    public let degree: Float16 = 0x.1p1
}

main() {
    var r = Rectangle()
    if (r.degree != Float16.NaN) {
        println(r.degree)
    }
    0
}
