// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CNac9ArrayListIlEixHl" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Apply(Struct-_CNat5ArrayIG_E<Int64>->@_CNat5ArrayIlEixHl
// ASSERT: scan-not Intrinsic(arrayGetUnchecked
// ArrayList.[](get) goes through Array.[] rather than getUnchecked, so this pass does not rewrite it.

import std.collection.*

main() {
    let a = ArrayList<Int64>([10, 20, 30])
    return a[1] - 20
}
