/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main() : Int64 {
    var a:Int8 = 1

    if ( !(a == 'a')){
        return 1
    }
    if ( a == 'b' ){
        return 2
    }
    return 0
}

extend Int8 {
    public Operator func ==(right:Rune):Bool { //error: illegal extend member in extend block
        if (right == 'a') {
            return true
        }else{
            return false
        }
    }
}
// ASSERT: scan parse_expected_decl
// ASSERT: scan parse_expected_name
