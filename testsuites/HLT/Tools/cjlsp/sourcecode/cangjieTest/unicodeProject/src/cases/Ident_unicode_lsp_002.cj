/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package unicodeProject.cases

let name_02: Rune = 'f'

func `中文`(aa_02: Rune): Rune {
    let namess_02: Rune = name_02
    return namess_02
}
//联想补齐
let name_test :Rune = `中文`(r'r')

func 仓颉(aa_b: Rune): Rune {
    return aa_b
}

let cc: Rune = 仓颉(r'b')
