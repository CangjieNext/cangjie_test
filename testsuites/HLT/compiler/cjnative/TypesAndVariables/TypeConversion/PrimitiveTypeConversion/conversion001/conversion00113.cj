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
    var a: Int64 = 127
    var aa: Int64 = -128
    var aaa: Int64 = 0
    var b: Int8 = Int8(a)
    var bb: Int8 = Int8(aa)
    var bbb: Int8 = Int8(aaa)
    var c: Int8 = 127
    var cc: Int8 = -128
    var ccc: Int8 = 0

    if (b == c && bb == cc && bbb == ccc) {
        return 0
    }
    return 1
}
