/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output




main():Int64 {
    return 0
}

func case01(){
    var a = { a: Int64;b:Int32 => }
    var b = a(1)
    return b
}


func case02(){
    var a = { a => a}
}

func case03(){
    var a = { a:Int32 }
}
// ASSERT: scan parse_expected_double_arrow_in_lambda
// ASSERT: scan parse_expected_operator_or_end
// ASSERT: scan parse_expected_right_delimiter
