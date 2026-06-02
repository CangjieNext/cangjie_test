/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: pkg006
// (not OHOS) EXEC: %compiler %cmp_opt %compile_lib_opt pkg006/*.cj -o a.%middle
// (not OHOS) EXEC: %compiler %cmp_opt a.%middle %f --output %output
// (OHOS) EXEC: %compiler %cmp_opt %compile_lib_opt pkg006/*.cj
// (OHOS) EXEC: %compiler %cmp_opt -la -L. %f --output %output
// RUN-EXEC: %run %run_opt %output %run_args

package test

import default.*

main() {
    foo()
}
