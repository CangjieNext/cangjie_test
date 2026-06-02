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
// ASSERT: regex Exception in thread "main" default\.Err|An exception has occurred
// (not O2) ASSERT: scan throwable_20037.cj:26
var RES = ""

class Err <: Exception {}

class A {
    public static func a(x: Int64):Unit {
        if (x == 1) {
            throw Err()
        }
    }
    public static func b(x: Int64):Unit {
        if (x == 1) {
            throw Err()
        }
    }
}

main() {
    A.a(2)
    A.b(1)
    return 0
}
