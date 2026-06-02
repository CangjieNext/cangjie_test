// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: call.cj
// EXEC: %compiler %cmp_macro %n.cj
// EXEC: %compiler call.cj
// EXEC: %compiler %enableCompileDebug %cmp_macro %n.cj
// ERRCHECK: %compiler call.cj %diag_json

macro package define

import std.ast.*

@When[!debug] // macro decl
public macro M0(input: Tokens) {
    input
}
// ASSERT: scan sema_undeclared_identifier
