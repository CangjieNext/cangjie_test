// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
/// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping %n.cj 2>&1 | compare %f

/// ASSERT: regex-begin define i64 @\"_CN7default6\<main\>Ev\".+\n
/// ASSERT: regex-after while.body.+\n
/// ASSERT: regex-after (?P<num0>%\d+) = load i8 addrspace\(1\)\*, i8 addrspace\(1\)\*\* @_CN7default4ins1E, align 8, !dbg !\d+
/// ASSERT: regex-after %\d+ = call i8\* @llvm\.cj\.get\.interface\.func\(i8 addrspace\(1\)\* noalias (?P=num0).+\n
/// ASSERT: regex-after while.body.+\n
/// ASSERT: regex-after (?P<num1>%\d+) = load i8 addrspace\(1\)\*, i8 addrspace\(1\)\*\* @_CN7default4ins2E, align 8, !dbg !\d+
/// ASSERT: regex-after %\d+ = call i8\* @llvm\.cj\.get\.interface\.func\(i8 addrspace\(1\)\* noalias (?P=num1).+\n

var ins1: I1 = CB()
var ins2: I1 = CB()

main() {
    for (i in 0..100000) {
        ins1.goo() // ITable lookup won't be moved outside
        for (j in 0..10000) {
            ins2.goo() // ITable lookup won't be moved outside
            ins1 = CC()
        }
    }
    0
}

/**
 * Some class/interface definitions
 */
interface I1 {
    func goo() {
        return 8
    }
}

class CB <: I1 {
    var kk = 9
    public func goo(): Int64 {
        kk
    }
}

class CC <: I1 {
    public func goo(): Int64 {
        25
    }
}
