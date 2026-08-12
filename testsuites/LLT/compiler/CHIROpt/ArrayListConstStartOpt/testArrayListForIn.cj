// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CN7default6<main>Hv" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Invoke(Class-_CNat8IteratorIG_E<Int64>&->@_CNat8IteratorIG_E4nextHv
// for-in over ArrayList should remain correct after ArrayListConstStartOpt.

import std.collection.*

main() {
    let a = ArrayList<Int64>([1, 2, 3, 4])
    var sum = 0
    for (x in a) {
        sum += x
    }
    return sum - 10
}
