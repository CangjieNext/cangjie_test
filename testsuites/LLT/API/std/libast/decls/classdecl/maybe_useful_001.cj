// DEPENDENCE: maybe_useful_001_define.cj
// EXEC: %compiler %cmp_macro maybe_useful_001_define.cj
// EXEC: %run_macro %compiler %cmp_opt %macro_lib %f -Woff unused -o %output
// EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import define.*

@M
class A {
    init() {}
    ~init() {}
}

main() {
    println("HHH")
}

/* SCAN-IN
HHH
 */
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
