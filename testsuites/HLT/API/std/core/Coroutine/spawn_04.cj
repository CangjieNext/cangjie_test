/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %overflow_wrapping %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT:scan 1

var globalVal: Int64 = 0

main(): Int64 {
    spawn {
        => spawn {
            => spawn {
                => spawn {
                    =>
                    globalVal = globalVal + 1
                    return 1
                }
            }
        }
    }
    sleep(Duration.second)
    print((globalVal).toString())
    return 0
}
