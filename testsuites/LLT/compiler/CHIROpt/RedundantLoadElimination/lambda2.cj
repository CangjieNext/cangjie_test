// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %enableO2 %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan try2 v2 is: Finally

main() {
    var v2 = "Thrown"
    func foo2() {
        try {
            throw Exception()
        } finally {
            println("try1 v2 is: " + v2)
            v2 = "Finally"
        }
    }
    try {
        foo2()
    } catch (e: Exception) {
        println("try2 v2 is: " + v2)
    }
}
