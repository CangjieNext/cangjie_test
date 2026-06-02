// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: m1.cj 
// EXEC: %compiler %cmp_macro m1.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output %macro_debug
// EXEC: %run %run_opt %output %run_args
import m1.*

@Same
main() {
    0
}
