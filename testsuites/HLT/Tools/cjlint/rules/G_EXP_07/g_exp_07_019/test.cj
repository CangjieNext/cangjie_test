enum RGBColor {
| Red(Int16)
}
main() {
    var c = RGBColor.Green(-100)
    
    let cs = match (c) {
        case Red(r) where 0 < r => "${r}"
        case _ => "not match"
    }
    println(cs)
}
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
