/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a11_01

  @Level:         1

  @Assertion:       5.6(11) In the following example, g captures the variable x declared by var, f invokes g, and x 
                    captured by g is not defined in f, then f cannot be used as a first-class citizen: 
                    func h(){ 
                        var x = 1 
                        func g() { x }      // captured a mutable variable 
                        func f() { 
                            g()        // invoked g 
                        } 
                        return f // error 
                    } 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

func h(){ 
    var x = 1 
    func g() { x }      // captured a mutable variable 
    func f() { 
        g()        // invoked g 
    } 
    return f // error 
} 

main() {
}
