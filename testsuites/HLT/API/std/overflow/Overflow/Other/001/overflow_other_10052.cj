/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f




main(){
    while (true) @OverflowSaturating{
        var x : Int8 = 100
        var y : Int8 = 100
        var res = Int64(x+y)
        print("success")
        return res - 127
    }
}
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_expr_or_decl_in
