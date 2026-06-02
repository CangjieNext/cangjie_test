// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// (CJNATIVE) ASSERT: regex The function call to foo2 in .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

public interface I {
    func foo2() {
    }
}

public class A {}

extend A <: I {
    func plus() {
        foo2()
    }
}

main() {
    return 0
}

// (not CJNATIVE) ASSERT: regex The function call to foo2 in .* was an apply call