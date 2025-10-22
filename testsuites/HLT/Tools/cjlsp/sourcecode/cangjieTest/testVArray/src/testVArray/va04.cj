/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testVArray

//嵌套使用
let b1: VArray<Int64, $2> = [1, 2]
let b2: VArray<VArray<Int64, $2>, $1> = [b1]
var b4: VArray<VArray<Int64, $2>, $2> = [[1, 2], [3, 4]]
let element1 = b4[1][0]
