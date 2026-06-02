/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:2
// DEPENDENCE:  test_40001.cj
// EXEC-PIPE-1: %compiler %cmp_macro test_40001.cj 2>&1 | compare %f
// EXEC-1: %run_macro %compiler %cmp_opt %macro_lib %f -o %output

@C


@C
import test.*

var flag = false

@C
main(){
    @C
    @M(flag = true)
    if (flag) {
        return 0
    }else{
        return 1
    }
}
// ASSERT: scan parse_unexpected_anno_on
