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
    var a: Int32 = 1

    func test() : ()->Int32 {
        {return a} // error: lambda captured a mutable variable directly, lambda cannot be used as a return value
    }

    var ret = test()()

    if ( ret != 1 ){
        return 1
    }

    return 0
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
