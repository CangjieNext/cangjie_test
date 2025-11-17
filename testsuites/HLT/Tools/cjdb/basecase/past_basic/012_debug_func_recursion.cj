/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {
    var Functioncall009: Int32 = demofun008(5) //函数递归/ Functioncall009=15
    var a: Int64 = 10
    return a
}
func demofun008(a: Int32): Int32 {
    if (a == 0) {
        return 0
    } else {
        return a + demofun008(a-1)
    }
}











