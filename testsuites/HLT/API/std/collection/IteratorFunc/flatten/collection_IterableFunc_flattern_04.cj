/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var map01 = HashMap<Int8, Int16>([(8, 9), (10, 25)])
    var arr01 = [map01, map01]
    var resultFlatten = flatten<HashMap<Int8, Int16>, (Int8, Int16)>(arr01)
    var element01 = resultFlatten.next().getOrThrow()
    var element02 = resultFlatten.next().getOrThrow()
    if (element01[0] != 8 || element02[0] != 10) {
        return 1
    }
    if (element01[1] != 9 || element02[1] != 25) {
        return 2
    }
    return 0
}
