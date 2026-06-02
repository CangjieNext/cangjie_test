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
// ASSERT: regex toStringTest:3

struct Foo {
    public func f(a: Int32): Int32 {
        return a
    }
}

var a: Int32 = Foo().f(3)

func run(): Int64 {
    print("toStringTest:" + a.toString())
    return 0
}

main(): Int64 {
    return run()
}
