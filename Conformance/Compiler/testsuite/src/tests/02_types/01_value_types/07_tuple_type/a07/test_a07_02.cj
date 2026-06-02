/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
   @Name:        02_01_07_a07_02

  @Level:         1
   @Assertion:   2.1.7(7) The syntax of Tuple Type is defined as:
                 tupleType
                    : '(' type (',' type)+ ')'
                    ;
   @Description: Check Tuple type syntax with complex types
   @Mode:        compileOnly
   @Negative:    no
   @Structure:   single
 */

struct R1 {
    let smth = 123
}

enum HandGame {
    ROCK | PAPER | SCISSORS
}

open class C1 {
    var some = 321
}

main() {
    var t1: ((Rune, Rune, HandGame, UInt64, UIntNative, ((Rune, Rune, Rune, Int64), ((Float64, Rune, Float64, Rune, 
        Float64, Int64), UInt8, C1, (Rune, Int64, (Rune, Float32, Rune)), UIntNative, Rune), UIntNative, Float16, (Rune, 
        (Float32, UIntNative, UInt8, ((R1, (((Float64, (Float64, (UInt32, Float16, Float16, (UInt8, Int64, Rune, 
        Int16, (Float64, Rune, Float64, (Float32) -> String))))))))))))))
    return 0
}
