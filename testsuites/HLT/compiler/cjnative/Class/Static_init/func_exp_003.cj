/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class cls {
    static var a: Int64 = 0
    static init() {
        func f(arg: Int64) {
            a = arg
        }
        f(1)
    }
}

main(): Int64 {
    if (cls.a == 1) {
        return 0
    }
    return 1
}
