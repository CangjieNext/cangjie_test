/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_01_a05_01

  @Level:         1

  @Assertion:    13.1.1(5) All unsafe functions cannot be used as a first-class
                 citizen, including cannot be assigned to a variable, cannot be
                 used as an argument or return value, cannot be used as an
                 expression.

  @Description:  Check call of unsafe function in nornal context.

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:      

*/

unsafe func func_01(x: Float64): Float64 { return x + 1.0f64; }

main() {
    var Func : (Float64)->Float64 = func_01
}