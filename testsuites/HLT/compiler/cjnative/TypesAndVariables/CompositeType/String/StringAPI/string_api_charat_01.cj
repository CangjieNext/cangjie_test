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
    var s1 = "abcb"
    var s2 = ""
    var s3 = "中国中"
    var res = 0
    var r2 = s2.get(1)
    var r3 = "中国中".get(9)
    if (r2 != None || r3 != None) {
        return 1
    }
    return 0
}
