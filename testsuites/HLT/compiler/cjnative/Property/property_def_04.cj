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
    if (Coo.m != 2) {
        return 1
    }
    if (Coo.n != 4) {
        return 2
    }
    Coo.m = 1
    if (Coo.m != 3) {
        return 3
    }
    if (Coo.n != 6) {
        return 4
    }
    return 0
}

struct Coo {
    public static var c: Int32 = 1
    public static let d: Int32 = 1
    public mut static prop m: Int32 {
        get() {
            return (c + d)
        }
        set(input) {
            c = input + 1
        }
    }

    public static prop n: Int32 {
        get() {
            return ((c + d) * 2)
        }
    }
}
