// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not code_catch
// ASSERT: scan code_finally

open class B <: Exception {}

main() {
    var a: B = B()
    try {
        a.printStackTrace()
    } catch (e: Exception) {
        println("code_catch")
    } finally {
        println("code_finally")
    }
    return 0
}
