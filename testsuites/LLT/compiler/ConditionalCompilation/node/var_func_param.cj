// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %n.cj
// ERRCHECK: %compiler %enableCompileDebug %n.cj %diag_json

func foo(@When[!debug] arg1!: Int64, arg2!: Int64) { // func param
    println(arg1 + arg2)
}

main() {
    foo(arg1: 1, arg2: 2)
}
// ASSERT: scan sema_undeclared_identifier
// ASSERT: scan sema_wrong_number_of_arguments
