/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: a
// EXEC: %compiler %cmp_opt %compile_lib_opt a/pkga.cj -o pkga.%middle
// EXEC: %compiler %cmp_opt %f pkga.%middle -o %output
// RUN-EXEC: %run %run_opt %output %run_args

import a.*

class B <: Test {
    prop aa: Int64 {
        get() {
            if (a != 1 || b != 2 || foo() != 3 || fooB() != 4 || pA != 5 || pB != 6) {
                return 1
            }
            return 0
        }
    }
}

main() {
    B().aa
}
