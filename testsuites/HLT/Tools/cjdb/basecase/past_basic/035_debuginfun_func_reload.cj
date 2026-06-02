/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {
    var mainnum: Int64 =demoinfun()
    return mainnum
}
func demoinfun(): Int64 {
    var Functioncall008: Int64 = demofun001(5, 5) //函数重载  Functioncall008=10
    return Functioncall008
}
func demofun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}
func demofun001(a: Int64, b: Int64 ): Int64 {
    return a + b
}






