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
    case01(1,2)
    case02()
    return 0
}

// for中的pattern加括号，编译报错
func case01(a: Int32, b: Int32){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    for ((item) in intList) if ( item > 3 ) { 
        item
    }
}

func case02(){
    let intList: List<Int32> = [0, 1, 2, 3, 4]
    var a: Int32 = 3
    var res = match (a) {
        case (b) => 0 
        case _ => 1
    }
    res
}
// ASSERT: scan parse_tuple_pattern_expected_more_field
// ASSERT: scan parse_expected_left_brace
// ASSERT: scan parse_expected_expr_or_decl_in
