// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %frontendCompiler %dump-ir-to-screen %cmp_opt %n.cj 2>&1 | compare %f
// ASSERT: regex define void @_CN7default1S6writeCHv.*?\{[\n\S\s]*?call void @llvm.cj.gcwrite.ref[\n\S\s]*?\}
// EXEC: %compiler %cmp_opt %f -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

class C {
    var a = 10
}

struct S {
    var c: C = C()

    mut func writeC() {
        c = C()
    }
}

main() {
    var s = S()
    s.writeC()
    return 0
}
