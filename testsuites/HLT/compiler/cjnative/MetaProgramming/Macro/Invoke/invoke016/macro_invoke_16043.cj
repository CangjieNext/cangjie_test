/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  define.cj
// EXEC: %compiler %cmp_macro define.cj
// EXEC: %run_macro %compiler %cmp_opt  %f -o %output 2>&1 | compare %f


import define.*

class A{var a : Int64 = 1}

main(){
    var a = @SAME{A()}().a
    var b = @SAME[0]{A()}().a
    if ((a == b) && (a == 1))
    {
        return 0
    }
    else
    {
        return 1
    }
}
// ASSERT: scan parse_expected_decl
