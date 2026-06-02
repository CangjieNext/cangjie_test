// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj common.cj
// EXEC: %compiler %compile_lib_opt common.cj -o common.%middle
// EXEC: %compiler %cmp_macro define.cj common.%middle
// EXEC: %compiler %cmp_opt %f -o %output common.%middle
// EXEC: %run %run_opt %output %run_args

import M.*

main() {
    var a = @M1()
    var b = A()
    return a - b.a
}
