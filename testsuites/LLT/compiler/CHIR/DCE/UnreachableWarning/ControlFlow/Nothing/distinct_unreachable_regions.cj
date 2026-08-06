// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Verify that distinct unreachable regions in one function are each reported once.
// EXEC-PIPE-0: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f

// ASSERT: scan-2 "DiagKind": "chir_dce_unreachable_expression_hint"

func checkDistinctRegions(flag: Bool): Int64 {
    if (flag) {
        return 1
        println("first unreachable region")
        return 2
    }
    if (!flag) {
        return 3
        println("second unreachable region")
        return 4
    }
    return 5
}

main() {
    checkDistinctRegions(true)
}
