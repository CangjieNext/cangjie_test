/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_08_03_a06_02

  @Level:         1

  @Assertion:       5.8.3(6)
                    struct Foo { 
                        var i = 0 
                        mut func f(): Unit { 
                            i += 1 
                            g() // ok 
                        } 
                        func g(): Unit { 
                            f() // error 
                        } 
                    } 
                    interface I { 
                        mut func f(): Unit { 
                            g() // ok 
                        } 
                        func g(): Unit { 
                            f() // error 
                        } 
                    } 

  @Description:     Negative example from spec.

  @Mode:            compileonly

  @Negative:        yes

  @Structure:       single

*/

interface I { 
    mut func f(): Unit { 
        g() // ok 
    } 
    func g(): Unit { 
        f() // error 
    } 
} 

main() {
}
