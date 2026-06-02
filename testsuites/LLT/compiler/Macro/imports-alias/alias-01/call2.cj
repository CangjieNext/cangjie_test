// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define1.cj 
// EXEC: %compiler define1.cj %cmp_macro
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output
// ASSERT: regex undeclared identifier 'M1'
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

// negative case
import p1.M1 as M

// msg: undeclared identifier 'M1'
@M1
class A {}

main() {
    0
}
