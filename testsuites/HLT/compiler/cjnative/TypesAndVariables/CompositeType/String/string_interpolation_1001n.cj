/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output



func run(): Int64 {
    var s:String = "hello"
    var a = "${s${s}}" 
    var b = "${${s}}" 
    print("${s${s}}") 
    print("${${s}}") 
    return 0
}

main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
// ASSERT: scan parse_empty_string_interpolation
