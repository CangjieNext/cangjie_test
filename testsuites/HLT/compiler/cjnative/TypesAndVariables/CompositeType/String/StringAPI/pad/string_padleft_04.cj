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

func run(): Int64 {
    var s1 = ""
    var s2: String = s1.padStart(92, padding: "a")

    print("s1 = " + s1 + "\n")
    var str = ""
    for (i in 0..92 : 1) {
        str = str + "a"
    }

    if (s2 == str) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
