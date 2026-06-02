// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../expr_macro.cj
// EXEC: %compiler %cmp_macro expr_macro.cj
// EERCHECK: %run_macro %compiler %cmp_opt %f -o %output

// ASSERT:scan invalid left-hand expression of assignment '='

internal import expr_macro.*

main(): Unit {
    var a = 1
    var b = 2
    @M((a, _ = b) = (2, 1))
}
