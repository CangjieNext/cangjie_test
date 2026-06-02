// DEPENDENCE: %n.lib.cj
// EXEC: %compiler %cmp_macro %n.lib.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output

package quote_insert

import quote_insert.m
import std.ast.*

main() {
    let s = m.MM(Tokens())
}
// ASSERT: scan error: undeclared identifier 'MM'
// ASSERT: scan  ==> pacakgeQualifiedMacroCall.cj:11:15:
// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

