/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: A
// EXEC:  %compiler %cmp_opt %compile_lib_opt ./A/A.cj -o a.%middle 
// ERRCHECK:  %compiler %cmp_opt  a.%middle  %f -o %output
// ASSERT: scan parse_expected_name

import A.**

main(){
    var res = NA(1).a + NA(1).a - 2
    return res
}
