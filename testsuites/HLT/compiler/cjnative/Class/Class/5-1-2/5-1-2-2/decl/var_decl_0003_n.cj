/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output

class Data {
    public let a : Int32 = 1
}

func run(): Unit {
    var value : Data = Data()
    value which is an initialized 'let' constant
}
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_expected_expr_or_decl_in
