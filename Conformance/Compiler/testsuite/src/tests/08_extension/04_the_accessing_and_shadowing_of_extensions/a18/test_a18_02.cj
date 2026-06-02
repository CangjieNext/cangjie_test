/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            08_04_a18_02

  @Level:         1

  @Assertion:       8.4(18) Example: Assume that two extensions of the same type E<X> are the extension 1 and the 
                    extension 2, and the constraint of X in the extension 1 is stricter than that in the extension 
                    2. In this case, members in the extension 2 can be directly used in the extension 1. Otherwise 
                    members in the extension 1 cannot be directly used in the extension 2

                    // B <: A
                    class E<X> {}

                    interface I1 {
                        func f1(): Unit
                    }
                    interface I2 {
                        func f2(): Unit
                    }
   
                    extend E<X> <: I1 where X <: B { // extension 1
                        public func f1(): Unit {
                            f2() // OK
                        }
                    }
                    
                    extend E<X> <: I2 where X <: A { // extension 2
                        public func f2(): Unit {
                            f1() // Error
                        }
                    }

  @Description:     Negative example from spec: members in the extension 1 cannot be directly used in the extension 2.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

open class A{}

class B <: A {}

// B <: A
class E<X> {}

interface I1 {
    func f1(): Unit
}
interface I2 {
    func f2(): Unit
}

extend E<X> <: I1 where X <: B { // extension 1
    public func f1(): Unit {
        f2() // OK
    }
}

extend E<X> <: I2 where X <: A { // extension 2
    public func f2(): Unit {
        f1() // Error
    }
}

main(): Unit {}