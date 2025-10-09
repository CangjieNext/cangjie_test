/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

func aoo<T>(x: (T) -> T): (T) -> T {
    var a = x
    return a
}
enum EE<T>{
    EE(T)
}

main(): Int64 {
    var b = aoo<Int32>({x: Int32 => Int32(1)}) //expr aoo<Int32>({x: Int32 => Int32(1)})
    var e = aoo({x: Int32 => Int32(1)}) //expr aoo({x: Int32 => Int32(1)})
    var a1 = EE.EE(b) //expr a1 or expr EE.EE(b)
    var a2 = EE.EE(e)
    var a3 = EE<(Int32) -> Int32>.EE(b)
    var a4 = EE<(Int32) -> Int32>.EE(e)
    return 0
}
