// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization %enableFuncInlining %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-0:%run %run_opt %output %run_args

func TestNotEqual<T>(a: Equatable<T>, b: T) {
    return a != b
}

func TestCompare<T>(a: Comparable<T>, b: T) {
    return a <= b
}

class A {}

extend A <: Equatable<A> {
    public operator func ==(rhs: A): Bool {
        return false
    }
    public operator func !=(rhs: A): Bool {
        return true
    }
}

main() {
    TestNotEqual(1, 2)
    TestCompare(1.1, 2.2)
    TestNotEqual(A(), A())
    0
}

// ASSERT: scan [Devirtualization] The function call to != at [32,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to <= at [31,5] was optimized to builtin op LE.
// ASSERT: scan [Devirtualization] The function call to != at [30,5] was optimized to builtin op NotEqual.
