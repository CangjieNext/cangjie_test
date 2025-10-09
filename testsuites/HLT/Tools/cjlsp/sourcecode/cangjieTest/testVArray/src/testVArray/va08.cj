/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

type P1 = VArray<Int64, $4>

type P2 = P1

var d1: P1 = VArray<Int64, $4>({i => i})
var d2 = P1({i => i})
var d3 = P2(repeat: 0)
var d4: P2 = [1, 2, 34, 5]
