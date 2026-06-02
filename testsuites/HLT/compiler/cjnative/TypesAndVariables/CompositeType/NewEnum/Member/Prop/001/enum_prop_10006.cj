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

enum A {
    a(Int64, Int64, Int64)

    public prop c: Int64 {
        get() {
            match (this) {
                case a(x, y, z) => x
                case _ => 0
            }
        }
    }
}

main(): Int64 {
    var i = A.a(1, 2, 3)
    return i.c - 1
}
