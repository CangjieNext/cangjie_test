// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: testDCEApply08.info
// EXEC: %compiler %cmp_opt %diag_json %f -o %output 2>&1 | compare %f
// EXEC-PIPE-0: %run %run_opt %output %run_args %output 2>&1 | compare testDCEApply08.info

// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"
// ASSERT: scan-1 "DiagKind": "chir_dce_unused_variable"

func test() {
    println("func")
    {a: Int64 => ()}
}

main() {
    test()(return 0)
    return 0
}
