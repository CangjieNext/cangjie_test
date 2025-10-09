/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

main(): Int64 {
    let lInt1:Int8 = 10
    //UInt
    let lUInt8:UInt8 = 5   
    //Float
    let lFloat16:Float16 = 12.12
    var vm7:Bool =false
    var vm8 =1
    vm7=true
    vm7 ='c' is Rune && !vm7
    let lInt8:Int8 = 11
    return 0
}
