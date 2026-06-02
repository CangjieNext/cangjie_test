
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_17_a01_01

  @Level:         1

  @Assertion:   4.17(1) Type check and type cast expressions are expressions that contain the is operator and the as
                operator, respectively. Refer to the last section for the precedence and associativity of the is
                operator and the as operator.
  @Description: Checks compilation and execution of a program that uses type check and type cast expressions. 
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

main() {
    let x = 1

    println(1 as Int8)
    println(x as IntNative)
    println(((x) as UInt64) as Float64)

    println(1 is String)
    println(x is Rune)
    println(((x) is Unit) is Array<Int64>)
}
