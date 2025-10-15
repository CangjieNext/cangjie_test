// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex define void @"_CN7default6<main>Hv".*?\{[\n\S\s]*?call i8 addrspace\(1\)\* @llvm.cj.gcread.ref[\n\S\s]*?\}
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class C1 {
    var i = 1
}

class C2 {
    var c1 = C1()
}

class C3 {
    var c2 = C2()
}

main() {
    var c3 = C3()
    var temp = c3.c2.c1
}
