// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// (not CJNATIVE)EXEC-PIPE: %frontendCompiler %dump-ir-to-screen %cmp_opt %enableCompileDebug %n.cj 2>&1 | compare %f

// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIc4BlueEl<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIc5GreenEGC_ZN7default5AppleIcE<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIc3RedEc<init>"

// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIi4BlueEl<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIi5GreenEGC_ZN7default5AppleIiE<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIi3RedEi<init>"

// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIl4BlueEl<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIl5GreenEGC_ZN7default5AppleIlE<init>"
// (not CJNATIVE)ASSERT: scan define weak_odr void @"_ZN7default5ColorIl3RedEl<init>"

class Apple<T> {
    init() {}
    init(x: Bool) {}
}

enum Color<T> {
    Blue(Int64) | Green(Apple<T>) | Red(T)
}

main(): Int64 {
    let cb = Color<Rune>.Blue(8)
    let ca = Green(Apple<Int32>())
    let cr = Red(123)
    return 0
}
