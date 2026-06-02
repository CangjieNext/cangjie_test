/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1

func run(): Int64 {
    var c1 = '1'
    var c2 = '1'
    var c3 = '1'
    if (c1 <= c2 && c1 <= c3) {
        return 0
    }
    return 1
}

main(): Int64 {
    return run()
}
