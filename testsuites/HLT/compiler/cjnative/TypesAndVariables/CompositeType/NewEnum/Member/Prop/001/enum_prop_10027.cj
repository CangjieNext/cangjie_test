/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum A{
    a(Int64,Int64,Int64)
    public mut prop b : Int64{
       get(){1}
       set(v){}
       test(){} 
    }
}


main(): Int64 {
    var i = a(1,2,3)
    return 0
}
// ASSERT: scan parse_illegal_modifier_in_scope
// ASSERT: scan parse_expected_get_or_set_in_prop
