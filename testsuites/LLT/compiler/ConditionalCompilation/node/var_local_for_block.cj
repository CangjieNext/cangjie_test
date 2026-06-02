// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

main() {
    for (i in 0..5) {
        @When[!debug] // local var
        let b = 1
        println(b + i)
    }
}
// ASSERT: scan sema_undeclared_identifier
