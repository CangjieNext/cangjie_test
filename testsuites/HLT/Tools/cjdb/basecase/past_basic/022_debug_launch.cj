/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */



main() {
    var a: Int64 = 1
    var b: Int64 = 2
    var c: Int64 = 3
    var d: Int64 = 4
    var e: Int64 = 1
    //变量初始化
    var f: Int32

    //函数名处
    f = launchfun001()
    e = a + b + c + d
    return e
}


func launchfun001(): Int32 {
    var a: Int32 = 10
    var b: Int32 = 20
    return a + b
}




