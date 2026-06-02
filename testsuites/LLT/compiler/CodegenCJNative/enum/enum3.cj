// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Goo()
    if (res == 1) {
        return 0
    }
    return 1
}

enum Day {
    Monday | Tuesday
}

func Goo(a!: Day = Monday) {
    var res: Int64 = match (a) {
        case Monday => 1
        case Tuesday => 2
    }
    return res
}
