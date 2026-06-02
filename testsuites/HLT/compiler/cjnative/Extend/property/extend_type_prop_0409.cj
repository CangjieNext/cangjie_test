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

main(): Int64 {
    var a: Int64 = 1
    var b = Int64.ns
    var c = ()
    var d = Int64.ms
    if (b != 1 || c != () || d != 2) {
        return 1
    }
    return 0
}

extend Int64 {
    public static prop ms: Int32 {
        get() {
            return 2
        }
    }
    public static prop ns: Int32 {
        get() {
            return 1
        }
    }
}
