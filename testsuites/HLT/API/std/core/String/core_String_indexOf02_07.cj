/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

main() {
    var str1 = ""
    var str2 = "ewqeqeqeqeq"
    var result1 = str1.indexOf(str1, -1)
    var result2 = str2.indexOf(str1, -1)
    println(result1)
    println(result2)
    if (result1 != Option<Int64>.Some(0)) {
        return 1
    }
    if (result2 != Option<Int64>.Some(0)) {
        return 2
    }
    return 0
}
