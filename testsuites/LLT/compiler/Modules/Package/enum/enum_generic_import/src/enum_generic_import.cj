// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src
// EXEC: %compiler %cmp_opt %compile_lib_opt src/pkga/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt pkga.%middle %f  -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

internal import pkga.*

func run(): Int64 {
    var nouse = TimeUnit2.Hour(3)
    var time = TimeUnit.Hour(3)
    var res: Int64 = match (time) {
        case Hour(x) => x - 1
    }
    if (res == 2) {
        return 0
    } else {
        return 1
    }
}

main(): Int64 {
    return run()
}
