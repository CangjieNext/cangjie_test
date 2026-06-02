/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-1: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan my_exception
// ASSERT: scan RES IS: end
// (not O2) ASSERT: scan throwable_20035.cj:32
var RES = ""

class A <: Exception {
    public override prop message: String {
        get() {
            RES = RES + "a"
            return "my_exception"
        }
    }
    public override func toString(): String {
        RES = RES + "b"
        return "my_exception"
    }
}

func test(x: Int64) {
    if (x == 1) {
        throw A()
    }
}

main() {
    try {
        test(1)
    } finally {
        print("\nRES IS: " + RES + "end\n")
    }
    return 0
}
