// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto-not call void @llvm.cj.gcwrite.struct
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

struct S1 {
    var i = 1
    var j = 0
}

struct S2 {
    var s1 = S1()
    var i = 2
}

class C2 {
    var s2 = S2()
}

main() {
    var c2 = C2()
    c2.s2.s1 = S1()
}
