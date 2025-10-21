/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

import std.collection.*

let csa1 = HashSet<Int64>([0, 1, 2])

type v1 = HashSet<Int64>
let cas2: v1 = v1([2, 3])

let aas: Array<Int64> = [1, 3, 4]
type BB = Array<Int64>

let a2: BB = [1, 3, 4]
