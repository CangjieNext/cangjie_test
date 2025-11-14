// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor {
    | Red | Green | Blue
}

main() {
    var rType = RGBColor.Red
    let t = match (rType) {
        case Red | Green => 
        match (rType) {
            case Red => 0
            case _ => 2
        }
        case Green => 2
        case Blue => 2
    }
    return t
}
