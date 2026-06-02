// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
// EXEC:%compiler %cmp_macro pkg/define.cj
// EXEC: %run_macro %compiler %compile_lib_opt %cmp_opt pkg/pkg.cj -o pkg.%middle
// EXEC:%compiler %cmp_opt %f pkg.%middle -o %output
// EXEC: %run %run_opt %output %run_args

import pkg.*

main() {
    var time = TimeUnit.Month
    var res: Int32 = match (time) {
        case Day => 1
        case Month => 0
        case _ => 2
    }
    return res
}
