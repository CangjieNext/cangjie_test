/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan ababa

enum A {
    a(Int64, Int64, Int64)

    public prop c: B {
        get() {
            print("a");
            b(1, 1, 1)
        }
    }
}

enum B {
    b(Int64, Int64, Int64)

    public prop c: A {
        get() {
            print("b");
            a(1, 1, 1)
        }
    }
}

main(): Int64 {
    var i = a(1, 2, 3)
    i.c.c.c.c.c
    return 0
}
