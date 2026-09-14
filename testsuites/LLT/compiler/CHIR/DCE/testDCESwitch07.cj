// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE: %compiler %cmp_opt %diag_json %enableO2 %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

// ASSERT: scan-1 "DiagKind": "chir_unreachable_pattern"
// ASSERT: scan-1 "DiagKind": "chir_dce_unreachable_expression_hint"

class A {
    func test() {
        match (1) {
            case 1 | 2 | 3 => return 1
            // EXPECT: chir_unreachable_pattern
            case _ => return 2
        }
        // EXPECT: chir_dce_unreachable_expression_hint
        return 1
    }
}

main() {
    A().test()
    return 0
}
