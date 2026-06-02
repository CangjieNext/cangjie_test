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
    var varreturnexpr: Int32    //设置断点1： 9/18/20
    varreturnexpr = demofun002(10, 20)
    var varreturn: Unit //设置断点2： 11/26/28
    varreturn = demofun003(10, 20)

    var var1: Int64 = 9
    return var1
}
func demofun002(a: Int32, b: Int32): Int32 {
    if (a >= b) {
        return a
    } else {
        return b
    }
}

func demofun003(a: Int32, b: Int32): Unit {
    if (a >= b) {
        return
    } else {
        return
    }
}











