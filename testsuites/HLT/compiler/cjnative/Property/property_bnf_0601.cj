/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main():Int64 {
    return 0
}

open class Boo{
    public prop a1:Int64 {return 1} 
}

class Coo <: Boo {
}
// ASSERT: scan parse_expected_get_or_set_in_prop
// ASSERT: scan parse_unexpected_declaration_in_scope
// ASSERT: scan parse_expected_right_delimiter
