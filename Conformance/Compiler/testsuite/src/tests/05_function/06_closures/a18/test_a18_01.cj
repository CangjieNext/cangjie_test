/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_06_a18_01

  @Level:         1
  
  @Assertion:       5.6(18)
                    // 1. The captured variable must be defined before the closure. 
                    let x = 4 
                    func f() { 
                        print("${x}")       // Print 4. 
                        let x = 99 
                        func f1() { 
                            print("${x}") 
                        } 
                        let f2 = { => 
                            print("${x}") 
                        } 
                        f1()             // Print 99. 
                        f2()             // Print 99. 
                    } 

                    // 2. The variable must be initialized before being captured. 
                    let x = 4 
                    func f() { 
                        print("${x}")       // Print 4. 
                        let x: Int64 
                        func f1() { 
                            print("${x}")       // Error: x is not initialized yet. 
                        } 
                        x = 99 
                        f1() 
                    } 

                    // 3. If there is a local variable in a block, closures capture variables of the same name in the 
                    outer scope will report a warning. 
                    let x = 4 
                    func f() { 
                        print("${x}")       // Print 4. 
                        func f1() { 
                            print("${x}")      // warning 
                        } 
                        let f2 = { => 
                            print("${x}")      // warning 
                        } 
                        let x = 99 
                        f1()     // print 4 
                        f2()     // print 4 
                    } 

  @Description:     Positive examples from spec: case 1.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

let x = 4 
func f() { 
    print("${x}")       // Print 4. 
    Assert.equals(4, x)
    let x = 99 
    func f1() { 
        print("${x}")       
        Assert.equals(99, x)
    } 
    let f2 = { => 
        print("${x}")       
        Assert.equals(99, x)
    } 
    f1()             // Print 99. 
    f2()             // Print 99. 
} 

main() {
    f()
    0
}
