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
    | a(Int64)
    | a(Int64, Int64)
    | a(Int64, Int64, Int64)

    public prop b: A {
        get() {
            a(1, 1, 1)
        }
    }
}

main(): Int64 {
    var i = a(1, 2, 3)
    return 0
}
