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
    var a = Float32(-3.4 * 10.0 ** 38.0)
    var aa = Float32(-1.18 * 10.0 ** -38.0)
    var aaa = Float32(1.18 * 10.0 ** -38.0)
    var aaaa = Float32(3.4 * 10.0 ** 38.0)
    var b = Float32(a)
    var bb = Float32(aa)
    var bbb = Float32(aaa)
    var bbbb = Float32(aaaa)
    var c = Float32(-3.4 * 10.0 ** 38.0)
    var cc = Float32(-1.18 * 10.0 ** -38.0)
    var ccc = Float32(1.18 * 10.0 ** -38.0)
    var cccc = Float32(3.4 * 10.0 ** 38.0)

    if (b == c && bb == cc && bbb == ccc && bbbb == cccc) {
        return 0
    }
    return 1
}
