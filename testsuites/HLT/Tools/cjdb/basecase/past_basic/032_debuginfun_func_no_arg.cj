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
    var Functioncall001: Int32 = demofun001() //单行中只有一个调用 ,无入参： Functioncall001=30
    var Functioncall002: Int32 = demofun001() + demofun001() //单行中多个调用： Functioncall002=60
    var Functioncall003: Int8 = demofun005() //external函数被调用： Functioncall003=30
    var a: Int64 = 10
    return a
}
func demofun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}
public func demofun005(): Int8 {
    var a: Int8 = 10
    var b: Int8 = 20
    return a + b
}









