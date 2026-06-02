// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj common.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt common.cj -o common.%middle
// EXEC: %compiler %cmp_opt %cmp_macro define.cj common.%middle
// EXEC: %compiler %cmp_opt %f common.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import M.*

main() {
    var a = foo()
    return a - 1
}
