/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a06_01

  @Level:         1

  @Assertion:    12.1.1.2(6) For example: 
            func f(): Int64 { 
                 var x = 1; 
                 try { 
                     return x + x;     // Return 2. 
                 } catch (e: Exception) { // Caught. 
                     print("Exception and its subtypes can be caught here") 
                 } finally { 
                     x = 2; 
              }  // The return value is 2 but not 4. 

  @Description:  Checks the example from specification.

  @Mode:         run

  @Negative:     no

  @issue:        0006343

  @Structure:    single

*/

import utils.assert.Assert
main() {
    func foo() : Int64 {
        var x = 1
        try {
            return x + x
        } catch (e: Exception) {
            print("Exception and its subtypes can be caught here")
            4
        } finally {
            x = 2
        }
    }
    Assert.equals(2, foo())
}
