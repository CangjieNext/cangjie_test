/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f

main(): Int64 {
    var varChar : Rune = \r'\'
    return 1
}
// ASSERT: scan lex_unknown_start_of_token
// ASSERT: scan lex_unterminated_char_literal
