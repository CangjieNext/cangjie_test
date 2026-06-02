/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: regex IndexOutOfBoundsException

func run(): Int64 {
    var c6: Array<Rune> = [r'仓', r'颉', r'b', r'f', r'F', r'3', r'7', r'9']

    var s6: String = String(c6)[88..]

    print("s6=" + s6 + "\n")

    return 0
}

main(): Int64 {
    return run()
}
