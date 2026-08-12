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
// ArrayList(size, lambda) init + == ; start rewrite same as testArrayListEq.

import std.collection.*

let arrList_32 = ArrayList<Int64>(32, { i => i })
var res = false

main() {
    let compareArrayList = ArrayList<Int64>(32, { i => i })
    res = arrList_32 == compareArrayList
    println(res)
    return if (res) {
        0
    } else {
        1
    }
}
