/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_02_a03_02

  @Level:         1

  @Assertion:       5.8.2(3)
                    interface I { 
                        mut func f1(): Unit 
                        func f2(): Unit 
                    } 
                    struct A <: I { 
                        mut func f1(): Unit {} // ok 
                        func f2(): Unit {} // ok 
                    } 
                    struct B <: I { 
                        func f1(): Unit {} // error 
                        mut func f2(): Unit {} // error 
                    } 
                    class C <: I { 
                        func f1(): Unit {} // ok 
                        func f2(): Unit {} // ok 
                    } 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

  @Issues:          6297

*/

interface I { 
    mut func f1(): Unit 
} 

struct B <: I { 
    public func f1(): Unit {} // error 
} 

main() { 
}