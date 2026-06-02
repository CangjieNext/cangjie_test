/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %n.%suffix 2>&1 | compare %f



main():Int64 {
    case01()
    return 0
}

func case01(){
    let score = 80
    let a = 80
    var result = match {
        case score < (60) => ()
        case (score) >= 60 =>  
        case _ => ()
    }
    return result
}
// ASSERT: scan parse_case_body_cannot_be_empty
