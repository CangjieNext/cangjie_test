/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res1 = Base().Goo()
    if (res1 == 7) {
        return 0
    }
    return 1
}

struct Base {
    private func Foo(a!: Int64 = 3): Int64 {
        return a
    }
    public func Goo(a!: Int64 = 4): Int64 {
        return Foo() + a
    }
}
