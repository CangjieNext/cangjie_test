/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// DEPENDENCE: define.cj
// (not iOS) EXEC: echo "define=./define.cjo" >> define.conf
// (not iOS) EXEC: %compiler %cmp_macro define.cj
// (not iOS) ERRCHECK: %run_macro %compiler %cmp_opt  %f -o %output

import define.*

main(){
    return 1
}

@M
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_illegal_macro_expand_input_args_without_paren
