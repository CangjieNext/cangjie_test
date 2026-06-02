// DEPENDENCE: define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt -Woff unused %macro_lib %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 2>&1 | compare %f

import define.*

main() {
    @OQL(select * from Account as "acc" where name = 'cangjie')
    println(alias_name)
    println(condition_name)
}

/* SCAN-IN
cangjie
acc
*/
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
