// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization %enableFuncInlining %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-0:%run %run_opt %output %run_args

func TestNext<T>(a: Countable<T>) {
    return a.next(0)
}

class A {}

extend A <: Countable<A> {
    public func position(): Int64 {
        0
    }
    public func next(right: Int64): A {
        A()
    }
}

main() {
    TestNext(1)
    TestNext(A())
    0
}

// ASSERT: scan [Devirtualization] The function call to next at [27,5] was optimized.
// ASSERT: scan [Devirtualization] The function call to next at [26,5] was optimized to builtin op next.
