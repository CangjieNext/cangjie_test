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
    var a: Int16 = 32767
    var aa: Int16 = -32768
    var aaa: Int16 = 0
    var b: Int64 = Int64(a)
    var bb: Int64 = Int64(aa)
    var bbb: Int64 = Int64(aaa)
    var c: Int64 = 32767
    var cc: Int64 = -32768
    var ccc: Int64 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
