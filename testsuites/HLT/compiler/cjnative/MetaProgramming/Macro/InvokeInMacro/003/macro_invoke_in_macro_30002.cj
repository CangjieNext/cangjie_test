/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a_30002.cj define_b_30002.cj
//  EXEC: %compiler define_a_30002.cj %cmp_macro
//  EXEC: %compiler define_b_30002.cj %cmp_macro 
//  EXEC: %compiler %cmp_opt %f -o %output

// RUN-EXEC: %run %run_opt %output %run_args

package use

import B.*

main() {
    return @b1[1](2) + @b2[1](2)
}
