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
    if (C2.foo() != 3) {
        return 1
    }
    return 0
}

open class C1 {
    public static func foo() {
        return 1
    }
}

interface I {
    static func foo() {
        return 2
    }
}

class C2 <: C1 & I {
    public static redef func foo() {
        return 3
    }
}
