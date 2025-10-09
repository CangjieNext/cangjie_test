/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.signature

func hh(a:Array<Int64>){}
func hh2(a:Array<Array<Int64>>){}

var r1 = hh([1,2])
var r2 = hh2([[1,2]])
var r3 = hh([11,22,33])

func fff(a:(Int64,Int64)){}
func fff2(a:(Int64,Int64),b:(Int64,Bool)){}
var tt1 = fff2((1,3), (1,true))
var t2 = fff((1,2))
var t3 = fff2((1,2),(1,true))

