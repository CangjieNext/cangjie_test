// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify a normally completing catch and finally leave the successor reachable.
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

func catchCompletesNormally() {
    try {
        throw Exception()
    } catch (_: Exception) {
        println("handled")
    } finally {
        println("cleanup")
    }
    println("reachable after try-catch-finally")
}

main() {
    catchCompletesNormally()
}

/* SCAN
*/
