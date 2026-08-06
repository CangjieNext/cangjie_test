// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.

// Verify nested control flow in an artificial continuation has one source-root warning only.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

func nestedArtificialContinuation(): Int64 {
    return 1
    if (true) {
        return 2
        if (false) {
            println("unreachable nested branch")
        }
    }
    0
}

main() {
    println(nestedArtificialContinuation())
}
