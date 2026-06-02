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
    var s: String = "Test String"
    let test: String = "Test String"
    if (s[0] != UInt8(UInt32(r'T'))) {
        return 1
    }
    if (s[5] != UInt8(UInt32(r'S'))) {
        return 1
    }
    if (s[10] != UInt8(UInt32(r'g'))) {
        return 1
    }
    if (test[0] != UInt8(UInt32(r'T'))) {
        return 1
    }
    return 0
}
