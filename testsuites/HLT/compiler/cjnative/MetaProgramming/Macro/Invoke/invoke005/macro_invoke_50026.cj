/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE:  test.cj  test.conf
// EXEC: %compiler %cmp_macro test.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output


import test.*

main(){
    var (@M(a),@M(b)) = (0, 1) 
    return a
}
// ASSERT: scan parse_tuple_pattern_expected_more_field
// ASSERT: scan parse_expected_pattern
// ASSERT: scan parse_expected_character
// ASSERT: scan parse_unmatched_right_delimiter
