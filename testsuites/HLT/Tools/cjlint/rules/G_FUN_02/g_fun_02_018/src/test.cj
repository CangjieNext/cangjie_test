/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

class Shape {}

extend Shape {
    func describe(name: String, precision: Int64): String {
        return name
    }
}

main() {
    let s = Shape()
    println(s.describe("circle", 2))
}
