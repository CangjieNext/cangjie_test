// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: m1.cj 
// EXEC: %compiler %cmp_macro m1.cj
// ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output %macro_debug
// ASSERT: scan expected declaration, found '{'


import m1.*

func test() {0}

main() {
    println("Okay")
    return @M{}()
}


