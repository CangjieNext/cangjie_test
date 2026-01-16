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

enum E1{
    AB
    func test1(){
        let c = Blue
        let cs = match (c) {
            case Red => "Red"
            case Green => "Green"
            case Blue => "Blue"
            case White => "Other"
        }
    }
}

main() {
    var c1 = E1.AB.test1()
    0
}
