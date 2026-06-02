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

main(): Int64 {
    var index: Int64 = 0
    for (i in 0..5) {
        index = i
        while (index < 20) {
            index = index + 1
            if ((index % 4 == 0) && (index % 6 == 0)) {
                print("$(index) is divisible by both 4 and 6") // output: 12
                break
            }
        }
        print("$(i)th test")
    }
    return 0
}
