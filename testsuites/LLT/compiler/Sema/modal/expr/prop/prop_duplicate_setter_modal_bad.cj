// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

class C {
    init() {}
    mut prop p: Int64 {
        get() { 0 }
        set(v) { }
        set(this @local!, v) { exclave {} }
        set(this @local!, w) { exclave {} }
    }
}
main() {}

// ASSERT: scan "DiagKind": "sema_redefinition",
// ASSERT: scan "Errors": 1,
