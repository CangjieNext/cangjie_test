// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

struct S {
    var i = 0

    @When[!debug] // mut member func decl
    public mut func g() {
        i += 1 // ok
    }
}

main() {
    var r = S()
    r.g()
}
// ASSERT: scan sema_not_member_of
