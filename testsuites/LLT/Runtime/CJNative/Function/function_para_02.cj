// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt --int-overflow=wrapping %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo(3, 2, 100, 200)
    if (res == 100) {
        return 0
    }
    return 1
}

func Foo(a: Int32, b: Int32, A: Int64, B: Int64): Int64 {
    if (a > b) {
        return A
    } else {
        return B
    }
}
