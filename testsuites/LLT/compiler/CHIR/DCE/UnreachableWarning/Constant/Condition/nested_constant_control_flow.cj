// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Cover nested true conditions and statically selected loop jumps.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f


// ASSERT: scan-5 "DiagKind": "chir_dce_unreachable_block_in_expression"

main() {
    if (true) {
        if (true) {
            if (true) {
                println("reachable nested condition")
            } else {
                println("unreachable nested third else")
            }
        } else {
            println("unreachable nested second else")
        }
    } else {
        println("unreachable nested first else")
    }

    while (true) {
        if (true) {
            break
        } else {
            println("unreachable break else")
        }
    }

    while (true) {
        if (true) {
            continue
        } else {
            println("unreachable continue else")
        }
    }
}
