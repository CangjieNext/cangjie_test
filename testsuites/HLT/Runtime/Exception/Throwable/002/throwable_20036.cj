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
// ASSERT: regex Exception in thread "main" default.Err|An exception has occurred
// (not O2) ASSERT: scan throwable_20036.cj:32
var RES = ""

class Err <: Exception {}

class A {
    public var a:Unit = {
        x: Int64 => if (x == 1) {
            throw Err()
        }
    }(2)
    public var b:Unit = {
        x: Int64 => if (x == 1) {
            throw Err()
        }
    }(1)
}

main() {
    A()
    return 0
}
