/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         13_01_03_01_a06_01

  @Level:         1

  @Assertion:    13.1.3.1(6)  For example, there is an add function defined in C
                 as follows: 

                   int64_t add(int64_t X, int64_t Y) { return X+Y; } 

                The add function is called in the Cangjie programming language.
                The code example is as follows: 

                  foreign func add(x: Int64, y: Int64): Int64 

                  main() { 
                    let x1: Int64 = 42 
                    let y1: Int64 = 42 
                    var ret1 = unsafe { add(x1, y1) } 
                    ... 
                  } 

  @Description:  Example from the specification.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/

import utils.assert.Assert

foreign func add(x: Int64, y: Int64): Int64

main() {
    let x1: Int64 = 42
    let y1: Int64 = 42
    var ret1 = unsafe { add(x1, y1) }
    Assert.equals(84, ret1)
}