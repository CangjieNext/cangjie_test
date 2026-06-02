// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex-auto-not llvm.cj.gcread
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class C {
    var a = 10
}

struct S1 {
    var c: C = C()
}

struct S2 {
    var s1 = S1()

    func readS1() {
        var temp = s1
        return temp
    }
}

main() {
    var s2 = S2()
    s2.readS1()
    return 0
}
