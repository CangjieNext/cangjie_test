/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
main(): Int64 {
    var a1: Array<Aoo> = Array<Aoo>(2,{ i => Aoo(i) })
    a1[0].a ++
    a1[0] = Aoo(4)
    return 0
}

extend<T> Array<T>{
    @Intrinsic
    public operator func [](index:Int64,value!:T):Unit{ 
        this[index+1] = value
        return ()
    }
}

class Aoo {
    public var a: Int64 = 1
    public let b: Int64 = 1
    public init (x: Int64 ){ a = x }
}
// ASSERT: scan parse_intrinsic_function_must_be_toplevel
// ASSERT: scan parse_intrinsic_function_cannot_have_body
