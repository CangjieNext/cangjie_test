// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj
// EXEC: %compiler define1.cj %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex-auto undefined macro package 'p2', expect a right package name for macro 

import p1.*

// p2 is undeclared
@p2.M1
class A {}

main() {
    0
}
