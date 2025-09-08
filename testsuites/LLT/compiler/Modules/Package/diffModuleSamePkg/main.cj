// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: M1 M2
// EXEC: %compiler %compile_lib_opt -p M1/p1 %mod_name_opt M1 -o M1/p1.%middle
// EXEC: %compiler %compile_lib_opt -p M2/p1 %mod_name_opt M2 -o M2/p1.%middle
// EXEC: %compiler M1/p1.%middle M2/p1.%middle %f -o %output
// EXEC: %run %run_opt %output %run_args

internal import M1.p1.*
internal import M2.p1.*

main(): Int64 {
    f1()
    f2()
    0
}
