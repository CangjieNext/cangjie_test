/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:     13_01_03_05_a02_01

  @Level:         1

  @Assertion:    13.1.3.5(2) Referring to the following example, a C graphics
                 library (libskialike.so) has a function distance that calculates
                 the distance between two points. The related structures and
                 functions in the C language header file are declared as follows: 

                    struct Point2D { 
                        float x; 
                        float y; 
                    }; 
                    float distance(struct Point2D start, struct Point2D end); 

                 When declaring a foreign function, you need to determine the
                 function name, parameter type, and return value type according
                 to the declaration of the C language function to be called. When
                 creating a C-side structure, you need to determine the name and
                 type of each field of the structure.

                 The code example is as follows: 

                    package main 

                    @C
                    struct Point2D { 
                        var x: Float32 
                        var y: Float32 
                    } 

                    foreign func distance(start: Point2D, end: Point2D): Float32 

  @Description:  Example from the specification.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Issue:        0006420

  @Comment:      Constructor is added to Point2D, it is absent in the example
                 from the specification.

*/

import utils.assert.Assert

@C
struct Point2D { 
    var x: Float32
    var y: Float32
    init(x: Float32, y: Float32) {
        this.x = x
        this.y = y
    }
} 

foreign func distance(start: Point2D, end: Point2D): Float32 

main() {
    let P1 = Point2D(1.0, 1.0)
    let P2 = Point2D(2.0, 2.0)
    let Val = unsafe{ distance(P1, P2) }
    Assert.approxEquals(1.414213562373095048801688724209f32, Val);
}