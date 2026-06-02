// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan 123catched Exception_A

class Exception_A <: Exception {}

main() {
    try {
        try {
            print(123)
        } finally {
            throw Exception_A()
        }
    } catch (e: Exception_A) {
        println("catched Exception_A")
    }
    return 0
}
