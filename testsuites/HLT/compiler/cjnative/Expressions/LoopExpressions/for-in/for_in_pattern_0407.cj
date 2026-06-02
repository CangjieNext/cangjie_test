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
    case01()
    return 0
}

func case01(){
    let intList: Array<TimeUnit> = [Year(1), Year(2)]
    var a: Float32 = 0
    for Year(in (Float32(1),Float32(2))) 
     in intList {
        a = a + a
    }
    a
}

enum TimeUnit {
    Year(Float32)
}
// ASSERT: scan parse_expected_left_paren
