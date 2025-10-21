/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

let ab1: (p1: Int64, p2: VArray<Rune, $3>) = (1, [r'1', r'2', r'3'])

func printAdd1(add: (VArray<Int64, $3>, Int64) -> Int64): Unit {}
