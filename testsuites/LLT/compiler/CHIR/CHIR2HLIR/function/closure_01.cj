// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f

func f() {
    var x = 1

    func g() {
        print(x) // OK, captured a mutable variable.
    }
    let b = g // Error, g cannot be assigned to a variable

    g // Error, g cannot be used as an expression
    g() // OK, g can be invoked

    // Lambda captured a mutable variable, cannot be assigned to a variable
    let e = {=> print("${x}")} // Error

    let i = {=> x * x}() // OK, lambda captured a mutable variable, can be invoked.

    return g // Error, g cannot be used as a return value.
}

main() {
    f()()
}
// ASSERT: scan sema_use_func_capture_var_alone
