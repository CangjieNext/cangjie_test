// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CNacXCNac9ArrayListIdEeqHY1_" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Intrinsic(arrayGetUnchecked
// ASSERT: regex-not Field\(%\w+, 1\)
// ArrayList<Float64>.== also rewrites start via member-name matching (not hard-coded layout index).

import std.collection.*

main() {
    let a = ArrayList<Float64>([1.0, 2.0])
    let b = ArrayList<Float64>([1.0, 2.0])
    return if (a == b) {
        0
    } else {
        1
    }
}
