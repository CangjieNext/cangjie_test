// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// Issue #1045: cross-package type alias should be usable for numeric type conversion.
// Verifies that `pkg.alias(value)` resolves as a type conversion when the alias
// targets a numeric type, mirroring the same-package path.

// DEPENDENCE: typealias_numeric_convert_cross_dep.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt typealias_numeric_convert_cross_dep.cj -o pkga.%middle
// EXEC-PIPE-0: %compiler %cmp_opt pkga.%middle %f -o %output 2>&1 | compare %f

// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace
// EXEC: %run %run_opt %output %run_args

import pkga

main(): Int64 {
    // === Cross-package numeric type alias conversion ===
    var a: UInt16 = pkga.word(20)
    if (a != 20) { return 1 }

    var b: Int64 = pkga.myInt64(-999999)
    if (b != -999999) { return 2 }

    var c: Float64 = pkga.myFloat64(2.71828)
    if (c < 2.71 || c > 2.72) { return 3 }

    var d: Rune = pkga.myRune(65)
    if (d != r'A') { return 4 }

    // === Cross-package chained/nested type alias ===
    var e: UInt16 = pkga.nestedWord(42)
    if (e != 42) { return 5 }

    var f = pkga.nestedInt64(-5)
    if (f != -5) { return 6 }

    // === Usage in expressions ===
    var g = pkga.word(10) + pkga.word(20)
    if (g != 30) { return 7 }

    // === Float literal -> integer type alias conversion (truncation toward zero) ===
    var h: UInt16 = pkga.word(20.05)
    if (h != 20) { return 8 }

    return 0
}
