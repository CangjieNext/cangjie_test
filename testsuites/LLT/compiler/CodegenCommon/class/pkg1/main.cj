// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a
// EXEC: %compiler %cmp_opt %compile_lib_opt a/a.cj -o a.%middle
// EXEC: %compiler %cmp_opt a.%middle %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan 11
internal import A.*

class CC <: BB {}

main() {
    println(xxx(CC()))
    0
}
