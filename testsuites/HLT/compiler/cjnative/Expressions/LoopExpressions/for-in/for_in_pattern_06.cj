/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

main():Int64 {
    if ( case01() != 5 ) {
        return 1
    }
    return 0
}

func case01(){
    let intList: Array<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 0
    let b: Int32 = 2
    for (in [0,1,2] in intList) { 
        a++
    }
    a
}
// ASSERT: scan parse_expected_pattern
// ASSERT: scan parse_expected_right_delimiter
