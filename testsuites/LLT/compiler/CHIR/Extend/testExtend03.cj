// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// ASSERT: regex The function call to f in .* was an apply call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface I {
    func f(): Int64
}

class C {}

type c = C

extend c <: I {
    public func f() {
        2
    }
}

main() {
    var a = c()
    return a.f() - 2  //apply
}