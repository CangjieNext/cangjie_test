// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj define1.cj
// EXEC: %compiler %cmp_macro %cmp_macro define.cj
// (Unix) EXEC: %compiler %cmp_macro define1.cj
// (Windows) EXEC: %compiler %cmp_macro define1.cj
// EXEC: %run_macro %compiler  %f -o %output
// EXEC: %run %run_opt %output %run_args

import define1

@define1.M
func test() {
}

main() {
    println("test")
}
