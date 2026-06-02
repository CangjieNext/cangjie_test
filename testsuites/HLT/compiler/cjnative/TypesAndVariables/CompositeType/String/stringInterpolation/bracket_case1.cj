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
let s1="hello world"
let s2="test_${s1)"
print(s2)
return 0
}
// ASSERT: scan lex_unterminated_single_line_string
