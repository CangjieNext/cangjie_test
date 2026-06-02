/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import std.collection.*

main(): Int64 {
    return run()
}

func run(): Int64 {
    var res = Foo()
    if (res == "fir") {
        return 0
    }
    return 1
}

func Foo(a!: HashMap<Int32, String> = HashMap<Int32, String>([(1, "Aa"), (2, "Bb"), (3, "Cc"), (1, "fir")])): String {
    return match (a.get(1)) {
        case Some(x) => x
        case _ => ""
    }
}
