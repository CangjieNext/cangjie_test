/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         10_02_01_a08_01

  @Level:         1

  @Assertion:   10.2.1(8)
                The following example illustrates how to define operator functions in the class type.
                Suppose we want to implement two operations, i.e., prefix negative (-) 
                and infix addition(+), on a class called Pointwhich containing two Int32 variable
                members x and y). The prefix negative receive a Point object
                then returns a new Point object whose value of x and y are the negative of x and
                y respectively from the received object. The infix addition receive two Point
                objects then returns a new Point object whose value of x and y are the sum of
                x and y respectively from the two received objects. First, define a Point class
                in which two operator functions with the name - and + are defined:
                class Point {                                                      
                    var x: Int32 = 0                                               
                    var y: Int32 = 0                                               
                    init (a: Int32, b: Int32) {                                    
                        x = a                                                          
                        y = b                                                          
                    }                                                              
                                                                                   
                    operator func -(): Point {                                     
                        return Point(-x, -y)                                       
                    }                                                              
                
                    operator func +(right: Point): Point {                         
                        return Point(x + right.x, y + right.y)                     
                    }                                                              
                }                                                                  
                
                //Then, operator - and + can be directly used on objects of Point: 
                main(): Int64 {                                                    
                    let p1 = Point(8, 24)                                          
                    let p2 = -p1     // p2 = Point(-8, -24)                        
                    let p3 = p1 + p2 // p3 = Point(0, 0)                           
                    return 0                                                       
                }                                                                  

  @Description:  Run time example from spec

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/


import utils.assert.Assert

class Point {
    var x: Int32 = 0
    var y: Int32 = 0
    init (a: Int32, b: Int32) {
        x = a
        y = b
    }

    operator func -(): Point {
        return Point(-x, -y)
    }
    
    operator func +(right: Point): Point {
        return Point(x + right.x, y + right.y)
    }
}

//Then, operator - and + can be directly used on objects of Point:
main(): Int64 {
    let p1 = Point(8, 24)
    let p2 = -p1     // p2 = Point(-8, -24)
    let p3 = p1 + p2 // p3 = Point(0, 0)
    Assert.equals(-8, p2.x)    
    Assert.equals(-24, p2.y)    
    Assert.equals(0, p3.x)    
    Assert.equals(0, p3.y)    
    return 0
}
