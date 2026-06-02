/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %import-cangjie-stdx %cmp_opt  %f -o %output


import stdx.encoding.json
main() : Int64 {

    var jsonstr="""
{
  name:"yangyang"
}
    """IPE: %compiler %cmp_opt %f -o %output

import stdx.encoding.json
main() : Int64 {

    var jsonstr="""
{
  name:"yangyang"
}
    """
    try{
        var jsonvalue=JsonValue.fromStr(jsonst name:"yangyang"
}
    """
    try{
        var jsonvalue=Js
    try{
        var jsonvalue=JsonValue.fromStr(jsonst name:"yangyang"
}
    """
    try{
        var jsonvalue=JsonValue.fromSt
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_catch_or_finally_in_try
