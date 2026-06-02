/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_01_a02_01

  @Level:         1

  @Assertion:       5.8.1(2)
                    struct A { 
                        mut func f(): Unit {} // ok 
                        mut static func g(): Unit {} // error 
                        mut operator func +(rhs: A): A { // ok 
                            return A() 
                        } 
                    } 
                    extend A { 
                        mut func h(): Unit {} // ok 
                    } 
                    class B { 
                        mut func f(): Unit {} // error 
                    } 
                    interface I { 
                        mut func f(): Unit // ok 
                    }

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/

struct A { 
    mut func f(): Unit {} // ok 
    mut operator func +(rhs: A): A {
        return A() 
    } 
} 

extend A { 
    mut func h(): Unit {} // ok 
} 

interface I { 
    mut func f(): Unit // ok 
}

main() { 
} 
