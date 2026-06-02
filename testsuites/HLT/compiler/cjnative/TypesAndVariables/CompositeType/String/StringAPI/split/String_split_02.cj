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
    var s1: String = "he_ll_o"
    var s2 = s1.split("")

    if (s2[0] == "h" && s2[1] == "e" && s2[2] == "_" && s2[3] == "l"
        && s2[4] == "l" && s2[5] == "_" && s2[6] == "o") {
        return 0
    }

    return 1
}

main(): Int64 {
    return run()
}
