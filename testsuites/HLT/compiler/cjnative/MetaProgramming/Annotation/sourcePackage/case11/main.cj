/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// ERRCHECK: %compiler %cmp_opt %macro_lib %f -o %output


main() {
    var a = @sourcePackage
    return a - 6
}
// ASSERT: scan parse_illegal_macro_expand_input_args_without_paren
// ASSERT: scan parse_expected_decl
