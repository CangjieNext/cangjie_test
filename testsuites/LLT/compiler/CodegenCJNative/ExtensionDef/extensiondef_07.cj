// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %cmp_opt %n.cj -o %output 
// EXEC-PIPE-0: %run %run_opt %output 2>&1 | compare %f
/*SCAN
Array<Tuple<String, Int32>>
Array<Tuple<Int32, String>>
Int32
Float32
*/
import std.reflect.*
interface ITest<T, G> { 
    func foo() {
        println(TypeInfo.of<T>())
        println(TypeInfo.of<G>())
    }
}
struct SElem<T, G> {}
struct STest<T, G> { }
extend <T,G> Array<(T, G)> <: ITest<Array<(T, G)>, Array<(G, T)>> { }
extend <T,G> STest<SElem<T, G>, G> <: ITest<T, G> { }
main() {
    let a : Array<(String , Int32)> =[]
    a.foo()
    let s = STest<SElem<Int32, Float32> , Float32>()
    s.foo()
}