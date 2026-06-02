/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 |compare %f



// random seed:1614236150311

// All global variable need to be defined before use!
 let var12 : Float64 = (-34.0);

public var var18 : Record8 = Record8();

 struct Record8 {
    public Record8() {}
    public var var21 : Int64 = 102;
}

main(): Int64 {
    false;

    var var15 : Rune = 'k';

    match match var12 {
            case _ => var15
        } {
        case _ => var18
    }.var21;

    // CRC Check All Variables

    return 0;
}
// ASSERT: scan parse_trailing_closure_only_follow_name
// ASSERT: scan parse_selector_or_match_expression_body
// ASSERT: scan parse_expected_expr_or_decl_in
