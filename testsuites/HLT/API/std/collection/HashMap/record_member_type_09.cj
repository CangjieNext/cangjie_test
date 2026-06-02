/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %n.cj -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex key: 1;value: Aa
// ASSERT: regex key: 2;value: Bb
// ASSERT: regex key: 3;value: Cc

import std.collection.*

struct Data {
    public let width: HashMap<Int32, String> = HashMap<Int32, String>([(1, "Aa"), (2, "Bb"), (3, "Cc")])
}

func run(): Int64 {
    var res: HashMap<Int32, String> = Data().width
    for (item in res) {
        print("key: " + item[0].toString() + ";" + "value: " + item[1] + "\n")
    }
    return 0
}

main(): Int64 {
    return run()
}
