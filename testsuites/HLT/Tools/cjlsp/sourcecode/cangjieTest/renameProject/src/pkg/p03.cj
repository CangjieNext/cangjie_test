/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg
public func ff(x:Int32):Int32 { x+1 }

var aa1:Int32 =1
var aa2:Int32 =99

var res_1 = 1+2 |> ff
var res_2 = aa1+aa2 |> { x:Int32 => aa1+1 }

func h(b:Bool) {b}
let res3 = aa1< 0 || aa1>10 |> h
let res41 = false |> h
