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
        return match { case _ => {return a} } //error: type of return expression is incompatible with return type
    }

    if ( test()() != 1){
        return 1
    }

    return 0
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
