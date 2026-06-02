/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_a14_01

  @Level:         1

  @Assertion:    12.1.1(14) The following shows an example. 

       // Catch with wildcardPattern. 
       let arrayTest: Array<Int64> = [0, 1, 2]
       try { 
            let lastElement = arrayTest[3] 
       } catch (_) { 
            print("catch an exception!") 
       }

  @Description:  Checks the test case from specification is compiled correctly.

  @Mode:         compileonly

  @Negative:     yes

  @Issue:        0006271

  @Structure:    single

*/

main() {
    let arrayTest: Array<Int64> = [0, 1, 2]
    try { 
         let lastElement = arrayTest[3] 
    } catch (_) { 
         print("catch an exception!")
    }
    return 0
}
