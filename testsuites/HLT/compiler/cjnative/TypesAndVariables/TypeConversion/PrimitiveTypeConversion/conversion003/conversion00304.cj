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
    var a: Float64 = -1.8 * 10.0 ** 308.0
    var aa: Float64 = -2.23 * 10.0 ** -308.0
    var aaa: Float64 = 2.23 * 10.0 ** -308.0
    var aaaa: Float64 = 1.8 * 10.0 ** 308.0
    var b: Float64 = Float64(a)
    var bb: Float64 = Float64(aa)
    var bbb: Float64 = Float64(aaa)
    var bbbb: Float64 = Float64(aaaa)
    var c: Float64 = -1.8 * 10.0 ** 308.0
    var cc: Float64 = -2.23 * 10.0 ** -308.0
    var ccc: Float64 = 2.23 * 10.0 ** -308.0
    var cccc: Float64 = 1.8 * 10.0 ** 308.0

    if (b == c && bb == cc && bbb == ccc && bbbb == cccc) {
        return 0
    }
    return 1
}
