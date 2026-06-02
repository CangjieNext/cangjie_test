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

type str = String

type float = Float64

main(): Int64 {
    let list1: Array<str> = ["pi="]
    var list2: Array<float> = [3.1415]
    let str1: String = list1[0] + list2[0].toString()
    if (str1 == "pi=3.141500" || str1 == "pi=3.1415") {
        return 0
    }
    return 1
}
