// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %n.cj -o %output 2>&1 | compare %f
// (DEBUG_OPTION)EXEC: %run %output
// (CJNATIVE) ASSERT: regex The function call to \[\] in .* was an invoke call
// (CJNATIVE) ASSERT: regex The function call to \+ in .* was an invoke call
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

interface A<T> {
    operator func [](b: (A<T>, A<T>)): Bool {
        true
    }
    operator func +(b: (A<T>, A<T>)): Bool {
        true
    }
}

class A_B<T> <: A<T> {}

main(): Int64 {
    var a = (A_B<Int32>(), A_B<Int32>())
    var b = A_B<Int32>()
    if (!(b[a])) { //apply
        return 1
    }
    if (!(b + a)) {
        return 13
    }
    return 0
}

// (not CJNATIVE) ASSERT: regex The function call to \[\] in .* was an apply call
// (not CJNATIVE) ASSERT: regex The function call to \+ in .* was an apply call
