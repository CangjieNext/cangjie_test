/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f








main():Int64 {
    return 0
}


var b = { => class Coo{} } 
var b1 = b()

var c = { => class Coo } 
var c1 = c()

var d = { => enum TimeUnit{ Year } } 
var d1 = d()

var e = { => extend String{} } 
var e1 = e()
// ASSERT: scan-4 parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_right_delimiter
