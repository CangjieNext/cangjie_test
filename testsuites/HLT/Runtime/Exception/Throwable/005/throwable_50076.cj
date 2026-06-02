/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan success
// ASSERT: scan exception_A
// (not O2) ASSERT: scan throwable_50076.cj:27
class A <: Exception {
    public init(a: String) {
        super(a)
    }
}

func foo(a: Int64) {
    A("exception_A")
}

main() {
    try {
        throw 1 |> foo
        ()
    } catch (a: A) {
        a.printStackTrace()
        print("success")
    }
    return 0
}
