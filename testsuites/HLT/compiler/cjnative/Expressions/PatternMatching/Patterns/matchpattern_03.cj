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
    if ( case01() != 0 ) {return 1}
    if ( case02() != 0 ) {return 1}
    if ( case03() != 0 ) {return 1}
    return 0
}

func case01(){
    let score = 80
    let a = {=>70}
    let b = {=>80}
    var result: Int64 = match ({=>80}) {
        case a => 2
        case b => 0
        case _ => 10
    }
    return result
}

func case02(){
    let score = 80
    let a = {=>70}
    let b = {=>}
    var result: Int64 = match ({=>}) {
        case a => 2
        case b => 0
        case _ => 10
    }
    return result
}

func case03(){
    let score = 80
    let a = {=>70}
    let b = {=>}
    var result: Int64 = match ({=>}) {
        case a => 0
        case _ => 10
    }
    return result
}

extend ()->Int64 { =>
    public operator func ==(input:()->Int64,input_b:()->Int64):Bool{true}
}
// ASSERT: scan parse_expected_decl
