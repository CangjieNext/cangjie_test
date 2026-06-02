// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define5.cj ../define1.cj
// EXEC:%compiler define5.cj %cmp_macro
// EXEC:%compiler define1.cj %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt %f  -o %output
// ASSERT: regex-auto ambiguous match for macro call M1

// negative case
import p1.*
import p5.*

// p1.M1 or p5.M1
@M1
class A {}

main() {
    0
}
