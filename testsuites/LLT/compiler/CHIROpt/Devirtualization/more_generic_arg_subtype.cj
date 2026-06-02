// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization --no-sub-pkg -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: scan-not [Devirtualization] The function call to goo at [20,5] was optimized.

interface I1 {
    func foo(): Unit
}

class CA<T> <: I1 {
    public func foo(): Unit {}
}

func testFoo(a: I1) {
    a.foo()
    0
}

main() {
    testFoo(CA<Int64>())
    0
}
