// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// EXEC: %compiler %cmp_opt %enableO2 %n.cj %cffi-link -o %output
// EXEC-PIPE: %pwd_to_ld_path %run %run_opt %output 2>&1 | compare %f
// ASSERT: scan true, false, false, false, false, false, true, true, true, true

foreign {
    func X_And(b0: Bool, b1: Bool, b2: Bool, b3: Bool, b4: Bool, b5: Bool, b6: Bool, b7: Bool, b8: Bool, b9: Bool, b10: Bool): Bool
    func X_Or(b0: Bool, b1: Bool, b2: Bool, b3: Bool, b4: Bool, b5: Bool, b6: Bool, b7: Bool, b8: Bool, b9: Bool, b10: Bool): Bool
}

unsafe main() {
    var b0 = X_And(true, true, true, true, true, true, true, true, true, true, true)
    var b1 = X_And(false, true, true, true, true, true, true, true, true, true, true)
    var b2 = X_And(true, true, true, false, true, true, true, true, true, true, true)
    var b3 = X_And(true, true, true, true, true, true, false, true, true, true, true)
    var b4 = X_And(true, true, true, true, true, true, true, true, true, true, false)

    var b5 = X_Or(false, false, false, false, false, false, false, false, false, false, false)
    var b6 = X_Or(true, false, false, false, false, false, false, false, false, false, false)
    var b7 = X_Or(false, false, false, true, false, false, false, false, false, false, false)
    var b8 = X_Or(false, false, false, false, false, false, true, false, false, false, false)
    var b9 = X_Or(false, false, false, false, false, false, false, false, false, false, true)

    println("${b0}, ${b1}, ${b2}, ${b3}, ${b4}, ${b5}, ${b6}, ${b7}, ${b8}, ${b9}")

    0
}
