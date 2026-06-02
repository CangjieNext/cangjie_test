
/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        04_15_a04_01

  @Level:         1

  @Assertion:   4.15(4) The operand of - can only be an expression with one kind of numeric type.
  @Description: Checks that variables of numeric signed types can be operands of unary `-`. 
  @Mode: compileonly
  @Negative: no
  @Structure: single
  @CompileWarning: no

*/

main() {
    var vI8 : Int8 = 1
    println(-vI8)

    var vI16 : Int16 = 1
    println(-vI16)

    var vI32 : Int32 = 1
    println(-vI32)

    var vI64 : Int64 = 1
    println(-vI64)

    var vIN : IntNative = 1
    println(-vIN)

    var vF16 : Float16 = 1.0
    println(-vF16)

    var vF32 : Float32 = 1.0
    println(-vF32)

    var vF64 : Float64 = 1.0
    println(-vF64)
}
