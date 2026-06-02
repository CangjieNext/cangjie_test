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


func test(a:Int64,b:(Int64)->Int64){}

func test(a:Int64){}

main(){
    test(1)@SAME{i:Int64=>i}

    test(1)@SAME[1]{i:Int64=>i}

    0
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_trailing_closure_only_follow_name
// ASSERT: scan parse_expected_right_delimiter
