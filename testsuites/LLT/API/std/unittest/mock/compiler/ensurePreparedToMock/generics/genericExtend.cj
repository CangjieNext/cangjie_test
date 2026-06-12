/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -Woff=all --mock=on %f -o %output 2>&1
// EXEC-0: %run %run_opt %output %run_utest_opt %run_args 2>&1 | compare %f
// ASSERT: scan Done

class S<T> {
    S(public var x!: ?T = None){}
}

class A<T> {
    public var x: S<T> = S<T>()
}

extend<T> A<T> {
    public func foo() {
        x.x = None
    }

    public func bar(): S<T> {
        x
    }
}

main() {
    println("Done")
}