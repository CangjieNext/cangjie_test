/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define10028.cj
// EXEC: %compiler %cmp_macro define10028.cj
// ERRCHECK: %run_macro %compiler %cmp_opt %f -o %output


package use

import define10028.*

main(){
    return @M(\[) 
}
// ASSERT: scan parse_illegal_macro_expand_input_args
// ASSERT: scan parse_expected_right_delimiter
