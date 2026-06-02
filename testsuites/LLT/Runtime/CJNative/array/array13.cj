// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

main(): Int64 {
    var arr = [1, 2, 3, 4]
    var x = arr[2..]
    println(x)

    x = x[1..] // [4]
    println(x)
    if (x != [4] && x.size != 1) {
        return 1
    }
    return 0
}
