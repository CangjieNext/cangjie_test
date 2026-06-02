// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// ASSERT: scan-not was closure converted
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func f0() {
    return 0
}

let gv = 1

func f1() {
    return gv
}

class C {
    init() {}

    func methodF0() {
        return 0
    }
    func methodF1() {
        return gv
    }
}

struct S {
    init() {}

    func methodF0() {
        return 0
    }
    func methodF1() {
        return gv
    }
}

main() {
    f0()
    f1()
    let c = C()
    c.methodF0()
    c.methodF1()
    let s = S()
    s.methodF0()
    s.methodF1()
    0
}

