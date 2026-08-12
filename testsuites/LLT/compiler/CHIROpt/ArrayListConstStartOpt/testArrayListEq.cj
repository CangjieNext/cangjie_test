// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../pick_defination.py
// EXEC: %compiler %cmp_opt %enableO2 %dumpCHIRDebug -Woff unused %n.cj
// EXEC: %python pick_defination.py default_CHIR/[0-9]*_RunArrayListConstStartOpt.chirtxt "Func @_CNacXCNac9ArrayListIlEeqHY1_" | compare %f
// RUN-EXEC-PIPE-0: %run main
// ASSERT: scan Intrinsic(arrayGetUnchecked
// ASSERT: regex-not Field\(%\w+, 1\)
// ArrayList.== inlines getUnchecked and rewrites myData.start to Constant(0).

import std.collection.*

main() {
    let a = ArrayList<Int64>([1, 2, 3])
    let b = ArrayList<Int64>([1, 2, 3])
    let r = a == b
    println(r)
    return if (r) {
        0
    } else {
        1
    }
}
