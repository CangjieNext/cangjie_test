// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CNac9ArrayListIlEixHll" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Intrinsic(arraySetUnchecked
// ASSERT: regex-not Field\(%\w+, 1\)
// Mixed get/set: set path is rewritten; runtime checks both operators.

import std.collection.*

main() {
    let a = ArrayList<Int64>(8, { i => i })
    a[0] = 100
    a[7] = 200
    return a[0] + a[7] - 300
}
