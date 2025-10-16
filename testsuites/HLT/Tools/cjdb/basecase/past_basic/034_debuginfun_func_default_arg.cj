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
    var Functioncall006: Int32 = demofun007(2, b: 2) //命名形参 Functioncall006=4
    var Functioncall007: Int32 = demofun007(2) //可选形参  Functioncall007=3
    var a: Int64 = 10
    return a
}
func demofun007(a: Int32, b!: Int32 = 1): Int32 {
    var a1: Int32 
    a1 = a
    var b1: Int32 = b
    return a1 + b1
}







