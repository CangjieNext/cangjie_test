/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.collection.*

var vara = VArray<Int64, $3>({i => i})
var mixtuple01 = (true, 18, vara)
var mixtuple02: VArray<(Int64, Int64), $2> = [(11, 10), (9, 8)]

main(): Int64 {
    var vara = VArray<Int64, $3>({i => i})
    var mixtuple01 = (true, 18, vara)
    var mixtuple02: VArray<(Int64, Int64), $2> = [(11, 10), (9, 8)]
    return 0
}
