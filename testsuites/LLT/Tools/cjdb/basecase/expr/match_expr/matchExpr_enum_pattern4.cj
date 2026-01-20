// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

enum RGBColor {
    | Red | Green | Blue(Int64,String)
}
main() {
    let c = RGBColor.Blue(3,"abc")
    let cs = match (c) {
        case Green => "Green"
        case Blue(3,_) => "Blue"
        case Red => "red"
        case _ => "red"
    }
    print(cs)
    if (cs == "Blue") {
        return 0
    }
    return 1
}
