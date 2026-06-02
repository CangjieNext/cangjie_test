/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         12_01_01_02_a09_01

  @Level:         1

  @Assertion:    12.1.1.2(9) For example: 
            func f(): Int64 { 
                 var x = 1; 
                 try { 
                     return x + x; // Return 2. 
                 } catch (e: RuntimeException) { // Caught. 
                     print("RuntimeException and its subtypes can be caught here") 
                 } finally { 
                     x = 2; 
                     return x + x; // Return 4 
                 }  // The return value is 4 but not 2. 
            } 

  @Description:  Checks the return expression in the finally block will be replaced the type of try expression
                 set in the try block.

  @Mode:         run

  @Negative:     no

  @Issue:        0006372

  @Structure:    single

*/

import utils.assert.Assert
main() {
    func bar() : Int64 {
        var x = 1
        try {
            return x + x
        } catch (e: Exception) {
            print("Exception and its subtypes can be caught here") 
            2
        } finally {
            x = 2
            return x + x
        }
    }

    Assert.equals(4, bar())
}
