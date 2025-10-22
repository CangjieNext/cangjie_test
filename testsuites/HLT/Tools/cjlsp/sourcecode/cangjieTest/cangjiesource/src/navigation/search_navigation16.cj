/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.navigation
type I64 = Int64
var a1a:I64 =9

class LongNameClassA{
}
type B1B = LongNameClassA 

type P1 = (Float64,Float64)
type P2 = (Float64,Float64,Float64)

let p1 : P1 = (0.2,0.6)
let p2 : P2 = (0.3,0.4,0.6)

type AA = Array<Int64>

enum TimeUnit53{
    Day | Month | Year
}

type T_ime = TimeUnit53

var ab = T_ime.Day
var ab1 = T_ime.Month
