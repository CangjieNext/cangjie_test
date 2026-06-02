/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a12_01

  @Level:         1

  @Assertion:       5.6(12) In the following example, g captures the variable x declared by var, and f calls g. 
                    However, x captured by g is defined within f, and f does not capture other variables declared by 
                    var. Thus, f can be used as a first-class citizen: 
                    func h(){ 
                        func f() { 
                            var x = 1 
                            func g() { x }      // captured a mutable variable 
                            g() 
                        } 
                        return f // ok 
                    } 

  @Description:     Positive example from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func h(){ 
    func f() { 
        var x = 1 
        func g() { x }      // captured a mutable variable 
        g() 
    } 
    return f // ok 
} 

main() {
    Assert.equals(1,h()())
}
