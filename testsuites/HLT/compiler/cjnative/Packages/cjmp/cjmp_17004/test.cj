/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: mp
// (not O2) EXEC: %compiler %cmp_opt mp/test_com.cj %compile_chir_opt -o ./
// (not O2) EXEC: %compiler %cmp_opt mp/test_plat.cj %compile_dylib_opt_cjmp -o ./
// (not O2) EXEC: %compiler %cmp_opt %f %link_cjmp -o %output
// (not O2) RUN-EXEC: %run %run_opt %output %run_args

import mp.*

main() {
    try {
        C().f()
    } catch(e: NoneValueException) {
        var func_stack = ""
        for (ele in e.getStackTrace()) {
            func_stack += ele.methodName
        }
        println(func_stack)
        if (func_stack.contains("g2()C::f()main()")) {
            return 0
        }
    }
    return 1
}
