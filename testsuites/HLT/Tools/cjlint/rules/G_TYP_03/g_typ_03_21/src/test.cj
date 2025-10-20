class Rectangle {
    public let degree: Float64 = { a: Float64 => a }(0.5)
}

main() {
    var r = Rectangle()
    let x = r.degree
    if (x != Float64.NaN) {
        println(x)
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
