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
    var res = Foo()
    if (res == 0) {
        return 0
    }
    return 1
}

func Foo(c!: Int64 = -8, d!: Int64 = -16, e!: Int64 = -32, f!: Int64 = -64, g!: Int64 = 8, h!: Int64 = 16,
    i!: Int64 = 32, j!: Int64 = 64): Int64 {
    var res = c + d + e + f + g + h + i + j
    return res
}
