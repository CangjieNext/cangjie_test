/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a10_01

  @Level:         1

  @Assertion:       5.6(10) In the following example, g captures the variable x declared by var, then g cannot be used 
                    as a first-class citizen and can only be invoked. 
                    func f() { 
                        var x = 1 
                        func g() { 
                            print(x)    // OK, captured a mutable variable. 
                        } 
                        let b = g    // Error, g cannot be assigned to a variable 
                        g  // Error, g cannot be used as an expression 
                        g()   // OK, g can be invoked 
                        // Lambda captured a mutable variable, cannot be assigned to a variable 
                        let e = { => print("${x}") }  // Error 
                        let i = { => x*x }()  // OK, lambda captured a mutable variable, can be invoked. 
                        return g    // Error, g cannot be used as a return value. 
                    } 

  @Description:     Positive examples from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func f() { 
    var x = 1 
    func g() { 
        Assert.equals(1,x)
        print(x)    // OK, captured a mutable variable. 
    } 
    let i = { => x*x }()  // OK, lambda captured a mutable variable, can be invoked. 
    Assert.equals(1,i)
    g()
} 

main() {
}
