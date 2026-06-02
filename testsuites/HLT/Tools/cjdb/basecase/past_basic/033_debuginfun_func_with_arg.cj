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
    var Functioncall004: Int16 = demofun006(2) //单行中只有一个调用 ,单入参/ Functioncall004=2
    var Functioncall005: Int32 = demofun002(2, 1) //单行中只有一个调用 ,双入参 Functioncall005=2
    var a: Int64 = 10
    return a
}
func demofun002(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}
func demofun006(a: Int16): Int16 {
    if (a >= 1) {
        return a
    } else {
        return 0
    }
}












