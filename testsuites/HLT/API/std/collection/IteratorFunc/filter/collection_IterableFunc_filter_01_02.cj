/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: filterLogic.cj
// EXEC: %compiler %cmp_opt %f filterLogic.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.convert.*
internal import std.collection.*

main(): Int64 {
    var map1 = HashMap<Int64, String>([(1, "one"), (2, "two"), (3, "three")])
    var filterFunc = filter<(Int64, String)>({m: (Int64, String) => true})
    var actualResult01 = filterFunc(map1)
    var mapiterator01 = map1.iterator()
    var iteratorActual01 = actualResult01.iterator()
    for (i in 0..map1.size) {
        var elementActual = iteratorActual01.next().getOrThrow()
        var elementExpect = mapiterator01.next().getOrThrow()
        if (elementActual[0] != elementExpect[0] || elementActual[1] != elementExpect[1]) {
            return 1
        }
    }
    return 0
}
