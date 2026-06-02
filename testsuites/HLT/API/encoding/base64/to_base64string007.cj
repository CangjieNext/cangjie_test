/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.encoding.base64.*

main(): Int64 {
    var res1 = toBase64String([65u8, 66u8, 67u8, 65u8, 66u8, 67u8]) // ABC -> Base64
    var res2 = toBase64String([97u8, 98u8, 99u8, 65u8, 66u8, 67u8]) // abc -> Base64
    if (res1 != "QUJDQUJD") {
        return 1
    }
    if (res2 != "YWJjQUJD") {
        return 1
    }
    return 0
}
