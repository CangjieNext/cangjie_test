/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f

enum TimeUnit{
    Year(y:Int64,x!:Int64=match (1){ case _ => 1}) 
}

main(): Int64 {
    var a = TimeUnit.Year(1)
    var b = match (a) {
        case Year(a,b) => a+b
        case _ => 0
    }
    if ( a != 2 ){
        return 1
    }
    return 0
}
// ASSERT: scan parse_expected_right_delimiter
// ASSERT: scan parse_expected_decl
