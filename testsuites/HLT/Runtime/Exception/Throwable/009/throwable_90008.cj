/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-1: %run %run_opt %output %run_args

class B <: Exception {}

class A <: Exception {
    public override prop message: String {
        get() {
            return "a"
        }
    }
    public override func toString(): String {
        throw B();
        return "b"
    }
}

main(): Int64 {
    throw A()
    return 0
}
