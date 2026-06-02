// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE:  macro_define.cj
// EXEC: %compiler macro_define.cj %cmp_macro
// EXEC: %run_macro %compiler %cmp_opt %f -o %output
// EXEC: %run %run_opt %output %run_args

import test.*

@M[1]
main() {
    let s = "${@M[1] func test() { 0 };test()}"
    if (s != "0") {
        return 1
    }
    return 0
}
