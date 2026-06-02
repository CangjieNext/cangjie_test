/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE-1: %compiler %cmp_opt %f -o %output 2>&1 | compare %f


import std.collection.*
trait TR3<K1, K2> { func aoo3(a: This, b: K1, c: ArrayList<K2>): ArrayList<K2> }

class Data<T>{
    public var a:T
    public init(x:T){ a = x }
}

append<V1, V2> Data<V1> with TR3<V1, V2> {
    func aoo3(x: Data<V1>, y:V1, z:ArrayList<V2>): ArrayList<V2>{
        return z
    }
}

//func x(a:Int64):Int32{1}
func test_trait(){
    var b3 = aoo3<Data<Int32>,Int32,Int32>(Data<Int32>(1),2,ArrayList<Int32>(10,x))
    var e3 = aoo3(Data<Int32>(1),2,ArrayList<Int32>(10,x)) // 这种方式调用，如果没有定义x，将coredump
    Data<ArrayList<Int32>>(b3)
//   Data<ArrayList<Int32>>(e3)
}

func run():Int64{
    test_trait()
    return 0
}
main(): Int64 {
    return run()
}
// ASSERT: scan parse_expected_decl
