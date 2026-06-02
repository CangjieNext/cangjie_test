/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a09_01

  @Level:         1

  @Assertion:       5.6(9) In the following example, h only captures the variable y declared by let, then h can be 
                    used as a first-class citizen: 
                    func f(){ 
                        let y = 2 
                        func h() { 
                            print(y)    // OK, captured an immutable variable. 
                        } 
                        let d = h       // OK, h can be assigned to variable 
                        return h     // OK, h can be a return value 
                    } 

  @Description:     Positive examples from spec.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

func f(){ 
    let y = 2 
    func h() { 
        Assert.equals(2, y)
        print(y)    // OK, captured an immutable variable. 
    } 
    let d = h       // OK, h can be assigned to variable 
    return h     // OK, h can be a return value 
} 

main() {
    f()()
}
