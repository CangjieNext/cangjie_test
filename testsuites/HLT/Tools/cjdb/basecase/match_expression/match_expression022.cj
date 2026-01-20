/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

enum RGBColor {
    | Red | Green | Blue
}

main() {
    let c = Blue
    let cs = match (c) {
        case Red => "Red"
        case Green => "Green"
        case Blue => "Blue"
        case White => "Other"
    }
    println(cs)
}
