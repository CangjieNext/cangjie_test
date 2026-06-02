// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK:%compiler %cmp_opt %compile_lib_opt %n.cj
// EXEC:%compiler %cmp_opt %compile_lib_opt %n.cj %enableCompileDebug
// ASSERT: scan undeclared identifier 'A'

package b

@When[debug]
enum A {
    a
}

@When[!debug]
var res = A.a

