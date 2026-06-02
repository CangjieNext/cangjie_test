// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../define5.cj ../define1.cj
// EXEC:%compiler define5.cj %cmp_macro
// EXEC:%compiler define1.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

// negative case
import p1.M1 as Foo1
import p5.M1 as Foo2

@Foo1
class A {}

@Foo2
class B {}

main() {
    0
}
