// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

class C {
    init() {}
    prop p: Int64 {
        get(this @local!) : String @local! {
            exclave { "".transform() }
        }
    }
}
main() {}

// ASSERT: scan "DiagKind": "sema_prop_method_target_type_mismatch",
// ASSERT: scan "Errors": 1,
