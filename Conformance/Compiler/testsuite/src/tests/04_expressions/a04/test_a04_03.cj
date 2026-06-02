/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_a04_03

  @Level:         1

  @Assertion: 4(4): Expressions can be composed into composite expressions. 
  @Description: Checks that function names, function calls, pipelines, macros
                and composition expressions can be a part of the composed 
                expression.
  @Mode: run
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

import utils.assert.Assert

func f1(ff: () -> Int64) {  
    ff()
}

func f2(): Int64 {
    0
}

func f3(ff1: () -> Int64, ff2: (Int64) -> Int64): Int64 {
    return ff1() * ff2(15)
}


func f4(): Int64 {
    5
}

func f5(x: Int64): Int64 {
    x
}

func f6(ff: (Int64) -> Int64, x: Int64): Int64 {
    f5(x) 
}

func f7(x: Int64): Float32 { 
    Float32(x) 
}

func f8(x: Float32): Int64 { 
    Int64(x) 
}

main() {
    var macros = { a: Int64, b: Int64 => a + b }
    
    var res = f1(f2) * (f3(f4, f5) - 
            f6(f5, 2)) / 10 + 
            (f7 ~> f8)(1) * macros(2, 4) + 
            (18 |> { x: Int64 => x + 1 })

    Assert.isTrue(res is Int64)
    Assert.equals(25, res)
}
