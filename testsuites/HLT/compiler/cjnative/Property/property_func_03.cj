/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f  -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class Coo {
    public mut static prop a: Int64 {
        get() {
            return 0
        }
        set(v) {}
    }
    public var b: Int64 = a
    public static var c: Int64 = a
}

main(): Int64 {
    if (Coo().b != 0 || Coo.c != 0) {
        return 1
    }
    return 0
}
