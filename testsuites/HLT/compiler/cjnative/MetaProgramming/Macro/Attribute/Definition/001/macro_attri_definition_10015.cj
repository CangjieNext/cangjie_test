/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define_a.cj define_aa.cj
// EXEC: %compiler define_a.cj %cmp_macro
// EXEC: %compiler define_aa.cj %cmp_macro
// EXEC: %compiler %cmp_opt  %f -o %output 

package test

import define_a.*
import define_aa.*

main() {
    @testa(0)
    @testa[0](0)
    return 0
}
