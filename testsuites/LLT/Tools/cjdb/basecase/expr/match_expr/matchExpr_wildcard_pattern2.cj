// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor {
    | Red | Green | Blue | Yellow(Int64)
}

main() {
    let c = RGBColor.Red
    let cs = match (c) {
        case Green => " Green  "
        case Blue => "Blue"
        case _ => " red or Yellow "
    }
    print(cs)
    if (cs == " red or Yellow ") {
        return 0
    }
    return 1
}
