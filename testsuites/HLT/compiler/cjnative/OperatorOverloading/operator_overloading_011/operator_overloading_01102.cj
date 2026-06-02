/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output 
// RUN-EXEC: %run %run_opt %output %run_args

//interface Inc<T1> {
//    operator func ++(): T1
//}
interface Add<T1, T2> {
    operator func +(right: T1): T2
}

extend Rune <: Add<Rune, UInt32> {
    public operator func +(right: Rune): UInt32 {
        UInt32(this) + UInt32(right)
    }
}
//extend Rune <: Inc<Rune>{
//    operator func ++(): Rune { chr(UInt32(this) + 1)}
//}

main(): Int64 {
    var c1 = r'a'
    //let c2:Rune = c1++ 
    //let c2 = c1++ 
    let c3: UInt32 = c1 + r'b'
    if (c3 != 195) {
        return 1
    }
    return 0
}
