// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Regression: ideal integer literal inside a lambda that is immediately invoked
// (`({=> ...}())`) and passed as a function argument. The argument's expected
// type (`Int32`) must propagate into the lambda's return type so the literal
// `0` is unified as `Int32` instead of being fixed to the default `Int64`.
// Before the fix, `goo({=> return 0}())` failed with "expected 'Int32', found
// 'Int64'". Covers both the explicit `return` and the implicit-return forms.

// EXEC: %compiler %cmp_opt %f %compile_lib_opt -o %output

func goo(a: Int32): Unit {}

func fool() {
    goo({=> return 0}())
    goo({=> 0}())
    goo({=> return 1 + 2}())
}

main() {}