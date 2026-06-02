/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output


main():Int64{
    let s1 = ""  // empty string
    let s2: String = "Hello Cangjie Lang"  // define string s2
    var s3 = "\"Hello Cangjie Lang\""  // define string s3 containing character "
    var s4: String = "Hello Cangjie Lang\n"  // define string s4 containing
    let s5 = "hello\" 
    let s6 = "Hello "Cangjie Lang" 
    return 0 
}
// ASSERT: scan lex_unterminated_single_line_string
