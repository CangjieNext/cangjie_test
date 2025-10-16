// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

@When[!t]
let a = 1

main () {
    println(a)
}
// ASSERT: scan conditional_compilation_invalid_condition_expr