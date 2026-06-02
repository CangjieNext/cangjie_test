/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


main():Int64 {

    return 0
}

public mut prop a2:Int64 { 
    get(){
         return ( a + 1 )
    }
    set(v){ a = v}
}

open class Boo{
    public mut prop a2:Int64 {
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }
}
class Coo <: Boo {
}
// ASSERT: scan parse_unexpected_declaration_in_scope
