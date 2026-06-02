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
// ASSERT:scan Success

var glo = 0

main(): Int64 {
    var i: Int64 = 0

    while (i < 100) {
        i++
        spawn {
            glo = glo + 1
            return 1
        }
    }
    // Just a dummy task
    spawn {
        return 2
    }
    var tmp = 0
    sleep(Duration.second * 2)
    if (glo >= 0 && glo <= 100) {
        print("Success")
    } else {
        print("Fail")
    }
    return 0
}
