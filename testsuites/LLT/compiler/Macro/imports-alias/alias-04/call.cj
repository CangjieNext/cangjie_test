// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj define1.cj
// EXEC: %compiler %cmp_opt %cmp_macro define.cj
// EXEC: %compiler %cmp_opt %cmp_macro define1.cj
// EXEC-PIPE-1: %run_macro %compiler %cmp_opt %f  -o %output 2>&1 | compare %f
// ASSERT: scan 'B' is not a member of package 'define1'

import define.M as A
import define1.M1 as B
import define1

@define1.B
func test() {
}

main() {
    println("test")
}


