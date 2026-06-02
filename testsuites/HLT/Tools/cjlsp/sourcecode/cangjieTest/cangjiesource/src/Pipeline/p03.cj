/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.Pipeline

public func ff(x:Int32):Int32 { x+1 }

var a1:Int32 =1
var a2:Int32 =99

var res1 = 1+2 |> ff
var res2 = a1+a2 |> { x:Int32 => a1+1 }

func h(b:Bool) {b}
let res3 = a1< 0 || a1>10 |> h
let res41 = false |> h
