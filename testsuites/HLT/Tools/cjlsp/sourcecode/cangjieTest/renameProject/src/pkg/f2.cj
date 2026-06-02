/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

func hh(a: Int64) {}
func hh(a: Int32) {}

func hh(a: Float64) {}
func hh(a: Float32) {}

func hh(a: Int64, b!: Float32) {}
func hh(a: Int64, b!: Float64) {}

func hh(a: Int64, b!: Float64, c!: Rune, d!: Bool = true) {}

func te_st2() {
    var a = hh(1)
    var b = hh(1, b: 2.1)
    var d = hh(1, b: 4.4, c: r'b')

}
