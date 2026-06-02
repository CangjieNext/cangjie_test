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
    case01()
    return 0
}

func case01(){
    var result: Int64 = match () {
        case ()  => 1 
        case a => 0
        case _ => 10
    }
    return result
}
// ASSERT: scan parse_expected_expression
