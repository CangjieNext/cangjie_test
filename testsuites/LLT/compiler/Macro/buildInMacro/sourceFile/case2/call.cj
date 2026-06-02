// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: define.cj define1.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC:%compiler %cmp_macro define1.cj
// EXEC: %pwd_to_ld_path %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

package test

import define.*
import define1.*

main() {
    var fileName = @M1(0)
    if (fileName != "call.cj") {
        return 1
    }
    return 0
}
