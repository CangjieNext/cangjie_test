// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %compile_lib_opt %n.cj %diag_json
// EXEC:%compiler %cmp_opt %compile_lib_opt %n.cj %enableCompileDebug
// ASSERT: scan sema_undeclared_identifier

package b

@When[debug]
var a: Int32 = 3
@When[!debug]
var b = a + 1
