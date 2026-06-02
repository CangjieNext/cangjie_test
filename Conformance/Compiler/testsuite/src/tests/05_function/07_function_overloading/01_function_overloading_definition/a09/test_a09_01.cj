/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a09_01

  @Level:         1

  @Assertion:       5.7.1(9)
                    In the following example, functions f1 in interface I, class C1 and C2 are overloading. 
                    interface I { 
                        func f1() {...} 
                    } 
                    open class C1 { 
                        func f1(a: Int32) {...} 
                    } 
                    class C2 <: C1 & I { 
                        // f1 overloading 
                        func f1(a: Int32, b: String) {...} 
                    } 

  @Description:     Positive examples from spec

  @Mode:            compileonly

  @Negative:        no

  @Structure:       single

*/

interface I { 
    func f1() {} 
} 
open class C1 { 
    func f1(a: Int32) {} 
} 
class C2 <: C1 & I { 
    // f1 overloading 
    func f1(a: Int32, b: String) {} 
} 

main() {
}
