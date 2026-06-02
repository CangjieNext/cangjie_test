/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 04_a02_30

  @Level:         1
  @Assertion: 4(2) Every expression has a type. The process of calculating the 
              value of an expression is called the evaluation of the expression.
  @Description: Checks that composite expressions have type and value.
                Tests infix operators.
  @Mode: run
  @Negative: no
  @Structure: single

*/

import utils.assert.Assert

var x: Int64 = 5

func f(x: Int32): Float32 { 
    Float32(x) 
}

func g(x: Float32): Int32 {
    Int32(x) 
}

main() {
    Assert.isTrue(((x |> { 
            x: Int64 => x + 1 
        }) |> { 
            x: Int64 => 156 * 973 - if((x > 100) || (x < 50)) { 
                    x 
                } else { 
                    0 
                } 
            }) is Int64)
    
    Assert.equals(151782, 
        (x |> { 
            x: Int64 => x + 1 
        }) |> { 
            x: Int64 => 156 * 973 - if((x > 100) || (x < 50)) { 
                x 
            } else { 
                0 
            } 
        })

    var fg = f ~> g
    Assert.isTrue(fg(fg(fg(fg(fg(1))))) is Int32)
    Assert.equals(1, fg(fg(fg(fg(fg(1))))))
}
