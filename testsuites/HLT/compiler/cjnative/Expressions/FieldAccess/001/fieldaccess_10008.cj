/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// RUN-EXEC: %run %run_opt %output %run_args

class B{
    var x = 1
    var y = 1
}

class A<T>{
    static func test(){return B()}
}

main(){
    (
    A<Int64>
    .
    test()
    .
    x
    ,
    A<Int64>
    .
    test()
    .
    y
    )
    =
    (0,0)
    return 0
}
// ASSERT: scan parse_nl_warning
