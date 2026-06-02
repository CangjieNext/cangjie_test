// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableO2 %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex-auto @_CN7default1aE  = global
// (CJNATIVE) ASSERT: regex-auto @_CN7default1bE = global
// (not CJNATIVE) ASSERT: regex-auto @_ZN7default2ssE = global

var a: String = "bingo"
var b: String = "foo"
var ss = ["Buenos", "dias", "tardes"]

main() {
    println(a)
    println(b)
    println(ss)
    return 0
}
