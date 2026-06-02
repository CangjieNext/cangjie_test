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
// octal num is not supported for now.
main(): Int64 {
    var a: Int8 = 10
    var b: Int8 = 0
    var d: Int8 = 0
    b = a << 0o4
    print(b.toString() + "\n")
    if (b != -96) {
        return 1
    }
    d = -96 >> 0o4
    print(d.toString() + "\n")
    if (d != -6) {
        return 1
    }
    return 0
}
