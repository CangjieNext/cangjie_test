/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_public.cj main_30002.cj
// EXEC: %compiler %cmp_macro define_public.cj
// EXEC: %compiler %cmp_opt  %f %compile_lib_opt
// EXEC: %compiler %cmp_opt libdefine.a main_30002.cj -o %output

// RUN-EXEC: %run %run_opt %output %run_args

package define

import define_public.*

@M
func test() {
    0
}
