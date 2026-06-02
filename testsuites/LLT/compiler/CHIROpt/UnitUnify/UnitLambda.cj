// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [UnitUnify] unit unify at [23,13].
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f(): Unit {
    0
}

func g(a: Unit) {
    0
}

main() {
    var lambda1 = { => f()}
    let a = lambda1()
    g(a)
    0
}