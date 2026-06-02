/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */















import  pkgs1.varpkg1
import  pkgs2.varpkg2
import  pkgs1.pkgs101.fun101
import  pkgs1.pkgs101.pkgs102.fun102
import  pkgs1.pkgs101.pkgs102.pkgs103.fun103
import  pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.fun104
import  pkgs1.pkgs101.pkgs102.pkgs103.pkgs104.pkgs105.fun105

main(): Int64 {
    let test1: Int64 = varpkg1
    let test2: Int64 = varpkg2
    var Functioncall101: Int64 = fun101() //单行中只有一个调用 ,无入参： Functioncall101=20
    var Functioncall102: Int32 = fun102(2, 1) //单行中只有一个调用 ,双入参 Functioncall102=2
    var Functioncall103: Int16 = fun103(2) //单行中只有一个调用 ,单入参/ Functioncall103=2
    var Functioncall104: Int32 = fun104(2, b: 2) //命名形参 Functioncall104=4
    var Functioncall1041: Int32 = fun104(2) //可选形参  Functioncall1041=3
    var Functioncall105: Int32 = fun105(5) //函数递归/ Functioncall105=15
    return 1
}








