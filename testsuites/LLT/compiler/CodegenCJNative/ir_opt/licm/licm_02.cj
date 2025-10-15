// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix
/// (DEBUG_OPTION)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt --int-overflow=wrapping %n.cj 2>&1 | compare %f

/// ASSERT: regex-begin define internal void @_CN7default4workHCNY_2I1E.+\n
/// ASSERT: regex-after thunk.+\n
/// ASSERT: regex-after %\d+ = call i8\* @llvm\.cj\.get\.interface\.func\(i8 addrspace\(1\)\* noalias %x.+\n
/// ASSERT: regex-after while\.body.+\n
/// ASSERT: regex-after (?P<num0>%\d+) = call i8 addrspace\(1\)\* @_CN7default6getInsEv\(\), !dbg !\d+
/// ASSERT: regex-after %\d+ = call i8\* @llvm\.cj\.get\.interface\.func\(i8 addrspace\(1\)\* noalias (?P=num0).+\n
/// ASSERT: regex-after (?P<num1>%\d+) = load i8 addrspace\(1\)\*, i8 addrspace\(1\)\*\* %\d+, align 8, !dbg !\d+
/// ASSERT: regex-after %\d+ = call i8\* @llvm\.cj\.get\.interface\.func\(i8 addrspace\(1\)\* noalias (?P=num1).+\n
/// ASSERT: regex-after br label %block\.body.+\n

struct SA {
    var q: I1 = CB()
}

func getIns() {
    var ins: I1 = CB()
    return ins
}

func work(x: I1) {
    for (i in 0..100000) {
        x.goo() // ITable lookup will be moved outside
        getIns().goo() // ITable lookup won't be moved outside
        SA().q.goo() // ITable lookup won't be moved outside
    }
}

main() {
    var ins: I1 = CB()
    work(ins)
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
