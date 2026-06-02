/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_07_01_a11_01

  @Level:         1

  @Assertion:       5.7.1(11) In the following example, the number of function parameters is the same, and the types
                    in the same position are the same. Only the constraints of the type parameters contained in the 
                    parameter types are different, which are not overloaded functions. 
                    interface I1{} 
                    interface I2{} 
                    func f<T>(a: T) where T <: I1 {} 
                    func f<T>(a: T) where T <: I2 {} // Error, not overloading 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface I1{} 
interface I2{} 
func f<T>(a: T) where T <: I1 {} 
func f<T>(a: T) where T <: I2 {} // Error, not overloading

main() {
}
