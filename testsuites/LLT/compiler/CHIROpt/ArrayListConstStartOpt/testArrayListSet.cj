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
// ASSERT: scan Constant(0i)
// ASSERT: regex-not Field\(%\w+, 1\)
// ArrayList.[]= inlines setUnchecked and rewrites myData.start to Constant(0).

import std.collection.*

main() {
    let a = ArrayList<Int64>([1, 2, 3])
    a[1] = 99
    return a[1] - 99
}
