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
    func X_And(b0: Data2B, b1: Data2B, b2: Data2B, b3: Data2B, b4: Data2B, b5: Data2B, b6: Data2B, b7: Data2B, b8: Data2B, b9: Data2B, b10: Data2B): Data2B
    func X_Or(b0: Data2B, b1: Data2B, b2: Data2B, b3: Data2B, b4: Data2B, b5: Data2B, b6: Data2B, b7: Data2B, b8: Data2B, b9: Data2B, b10: Data2B): Data2B
}

@C
struct Data2B {
	var b: Bool = false
	var bx: Bool = false
}

unsafe main() {
    var mytrue = Data2B()
    mytrue.b = true
    mytrue.bx = true
    var myfalse = Data2B()
    var b0 = X_And(mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue)
    var b1 = X_And(myfalse, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue)
    var b2 = X_And(mytrue, mytrue, mytrue, myfalse, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue)
    var b3 = X_And(mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, myfalse, mytrue, mytrue, mytrue, mytrue)
    var b4 = X_And(mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, mytrue, myfalse)

    var b5 = X_Or(myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse)
    var b6 = X_Or(mytrue, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse)
    var b7 = X_Or(myfalse, myfalse, myfalse, mytrue, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse)
    var b8 = X_Or(myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, mytrue, myfalse, myfalse, myfalse, myfalse)
    var b9 = X_Or(myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, myfalse, mytrue)

    println("${b0.b}, ${b1.b}, ${b2.b}, ${b3.b}, ${b4.b}, ${b5.b}, ${b6.b}, ${b7.b}, ${b8.b}, ${b9.b}")

    0
}
