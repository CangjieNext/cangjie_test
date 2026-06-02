// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

main() {
    var b = 64
    var f = false
    if (f) {
        @When[!debug] // local var
        let a = 1
        b = a
    } else {
        @When[!debug] // local var
        let a = 1
        b = a
    }
    b
}
// ASSERT: scan sema_undeclared_identifier
