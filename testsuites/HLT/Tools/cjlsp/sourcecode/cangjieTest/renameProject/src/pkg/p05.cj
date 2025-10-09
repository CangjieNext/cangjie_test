/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

//函数重载
func fff(a: Int64) {}
func fff(a: Rune) {}

let g1: Int64 = 1
var g2 = g1 |> fff

let g3: Rune = 'a'
var g4 = g3 |> fff

func maifn1() {
    fff(1)
    fff(r'a')
}
