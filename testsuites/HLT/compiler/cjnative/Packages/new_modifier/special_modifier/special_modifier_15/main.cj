/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// ERRCHECK:  %compiler %cmp_opt %compile_lib_opt ./A/A.cj -o b.%middle 
// ASSERT: scan parse_expected_decl

import A.A_a
import A.A_a
import A.A_a

main(){
    var res = A_a(1).a + A_a(1).a + A_a(1).a - 3
    return res
}



import A.NA
import B.NA

main(){
    var res = NA(1).a + NA(1).a - 2
    return res
}
