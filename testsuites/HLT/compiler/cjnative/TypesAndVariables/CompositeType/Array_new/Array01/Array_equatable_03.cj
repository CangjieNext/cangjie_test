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

var a1 = ["a", "b", "c"]
var a2 = ["a", "b", "c"]
var a3 = ["1", "b", "c"]

main(): Int64 {
    if (a1 == a2) {
        print("a1==a2")
        if (a2 == a3) {
            return 1
        }
    }
    return 0
}
