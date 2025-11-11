/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */




var arrayTopInt8 : Array<Int8> = [1, 2, 3]
var arrayTopcopy =  arrayTopInt8.clone()

main() {
    var value_TopInt8 = arrayTopInt8[2]
    var value_Topcopy = arrayTopcopy[2]

    var Functioncall001: Int8 = demofun001()
    return 1
}

func demofun001(): Int8 {
    var arrayfun  = arrayTopInt8.clone()
    var a = arrayTopInt8[1]
    var b = arrayfun[2]
    return a + b
}


