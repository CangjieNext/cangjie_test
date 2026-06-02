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
    if (Coo.foo() != 2 || Boo.foo() != 1) {
        return 1
    }
    return 0
}

open class Boo {
    public static func foo() {
        return 1
    }
}

class Coo <: Boo {
    public static redef func foo() {
        return 2
    }
}
