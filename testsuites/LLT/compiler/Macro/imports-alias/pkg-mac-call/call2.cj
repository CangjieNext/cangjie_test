// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj
// EXEC: %compiler define1.cj %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: scan 'M2' is not a member of package 'p1'

import p1

// p1 is valid, but M2 is not found.
@p1.M2
class A {}

main() {
    0
}

