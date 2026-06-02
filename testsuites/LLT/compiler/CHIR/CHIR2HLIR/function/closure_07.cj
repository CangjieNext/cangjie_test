// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE: %compiler %cmp_opt %n.cj %diag_json -o %output 2>&1 | compare %f
// EXEC: %run %run_opt %output %run_args

// If there is a  local variable in a block, closures capture variables of the same name in the outer scope will report a warning.
let x = 4

func f() {
    print("${x}") // Print 4.
    func f1() {
        print("${x}") // warning
    }
    let f2 = {
        => print("${x}") // warning
    }
    let x = 99
    f1() // print 4
    f2() // print 4
}

main() {
    f()
}
// ASSERT: scan sema_capture_has_shadow_variable
// ASSERT: scan chir_dce_unused_variable
