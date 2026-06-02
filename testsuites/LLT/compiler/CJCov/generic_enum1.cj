// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %coverage_opt %n.cj -o %n.%suffix
// EXEC: %run %run_opt %n.%suffix

enum Time<T> {
    Day(T)
}

func run(): Int64 {
    var ut: Unit = ()
    var time = Time<Unit>.Day(ut)
    var res = match (time) {
        case Day(x) => x
    }
    if (res == ut && res == ()) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
