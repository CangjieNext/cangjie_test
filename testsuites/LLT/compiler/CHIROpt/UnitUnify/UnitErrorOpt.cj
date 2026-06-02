// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %enableO2 %debugCHIROpt %cmp_opt %n.cj -o %output | compare %f
// (DEBUG_OPTION)RUN-EXEC-PIPE-0: %run %output
// ASSERT: scan [UnitUnify] unit unify at [20,17].
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

class A <: Exception {}

main():Int64 {
    var a = 1
    try {
        throw A();
    } catch (e : A) {
        let a = e.printStackTrace()
        let x = a
    } finally {
        print("finally one.\n")
    }
    print("success.\n")
    return a-1
}