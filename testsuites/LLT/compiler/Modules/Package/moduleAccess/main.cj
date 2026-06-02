// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1 M2
// EXEC: %compiler %compile_lib_opt -p M1/p1 %mod_name_opt M1 -o M1/p1.%middle
// EXEC: %compiler %compile_lib_opt -p M2/p2 %mod_name_opt M2 -o M2/p2.%middle
// EXEC: %compiler M1/p1.%middle M2/p2.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

import M1.p1
import M2.p2

main() {
    let a: p1.A = p1.A()
    let b: p2.A = p2.A()
    0
}
