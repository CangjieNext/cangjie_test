// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import define.*

main() {
    var a = 1 + @M1()
    var b = 1 + @M2[]()
    var c = 1 + @M2[1]()
    var d = 1 + @M2[](1)
    if (a != 2) {
        return 1
    }
    if (b != 3) {
        return 1
    }
    if (c != 3) {
        return 2
    }
    if (d != 3) {
        return 3
    }
    return 0
}
