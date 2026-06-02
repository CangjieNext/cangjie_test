/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// ERRCHECK: %compiler %cmp_opt %f -o %output


main():Int64 {

    return 0
}

open class Boo{
    public var a: Int64 = 1
    public static var b: Int64 = 1

    public open static mut prop a1:Int64 { 
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

    public open override mut prop a2:Int64 {  
        get(){
             return ( a + 1 )
        }
        set(v){ a = v}
    }

}

class Coo <: Boo {
}
// ASSERT: scan parse_conflict_modifier
