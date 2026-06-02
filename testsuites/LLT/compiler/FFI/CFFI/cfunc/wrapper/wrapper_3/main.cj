// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: pkg.cj
// EXEC: %compiler %compile_lib_opt pkg.cj -o pkg.%middle
// EXEC: %compiler %cmp_opt_chir2hlir %enableO2 %f pkg.%middle -o %output
// EXEC-PIPE-0: %run %run_opt %output %run_args

import pkg.*

main() {
    unsafe {
        if (global_func_05() == 0) {
            return 0
        }
    }
    return 1
}