// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %enableO2 %f -o %output %dumpCHIRDebug
// RUN-EXEC: %run %output
// (Linux and DEBUG_OPTION) EXEC: sed -n -r '/\[public\] \[operator\] \[noReflectInfo\] Func @_CNacXCNac9ArrayListIlEeqHY1_/,/^}$/p' test_ArrayListConstStartOpt_CHIR/*_RunArrayListConstStartOpt.chir | compare %f

import std.collection.*

let arrList_32 = ArrayList<Int64>(32, {i => i})
var res = false

main() {
    let compareArrayList = ArrayList<Int64>(32, {i => i})
    res = arrList_32 == compareArrayList
    println(res)
}

// ASSERT: regex-not Field\(\d+, 1\)
// ASSERT: scan-2 Intrinsic/arrayGetUnchecked
