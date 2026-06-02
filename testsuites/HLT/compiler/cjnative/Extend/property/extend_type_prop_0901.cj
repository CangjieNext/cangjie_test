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
    if (UInt64.ns != 3) {
        return 3
    }
    if (UInt64.ms != 4) {
        return 4
    }
    return 0
}

extend UInt64 {
    public static prop ms: Int64 {
        get() {
            return 4
        }
    }
    public static prop ns: Int64 {
        get() {
            return 3
        }
    }
}
