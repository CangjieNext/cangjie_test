// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CNat5ArrayIlEixHl" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: regex Field\(%\w+, 1\)
// Plain Array.[] keeps Array.start Field; ArrayListConstStartOpt only rewrites ArrayList.myData.start.

import std.collection.*

main() {
    let al = ArrayList<Int64>([1])
    let a = Array<Int64>(3, { i => i + 1 })
    return a[1] + al[0] - 3
}
