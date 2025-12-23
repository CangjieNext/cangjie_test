// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-1: %compiler %diag_json %f -o %output -Woff all 2>&1 | compare %f

class C {
    init() {}
    mut prop bad: String {
        get() { "Hello" }
        set(this @local?, v) { }
    }
}
main() {}

// ASSERT: scan "DiagKind": "sema_property_setter_this_local_half_disallowed",
// ASSERT: scan "Errors": 1,
