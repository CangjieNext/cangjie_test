// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt -g %n.cj -o %n.%suffix
// (CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj --apc=1 2>&1 | compare %f
// (not CJNATIVE and DEBUG_OPTION) EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f
// (CJNATIVE) ASSERT: scan define private i8* @"default:Color.Ctor_0.Fn"
// (CJNATIVE) ASSERT: scan define private i8* @"default:Color.Ctor_1.Fn"
// (not CJNATIVE) ASSERT: scan define weak_odr void @"_ZN7default5Color4BlueEl<init>"
// (not CJNATIVE) ASSERT: scan define weak_odr void @"_ZN7default5Color5GreenEcb<init>"

enum Color {
    Blue(Int64) | Green(Rune, Bool) | Red
}

class CA {
    init() {}
    init(x: Bool) {}
}

main(): Int64 {
    let p = 9
    var lam2 = {=> 10 + p}
    lam2()
    let e = Blue(8)
    let ins = CA()
    return 0
}
