/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_a04_01

  @Level:         1

  @Assertion:    11.1.5(4) Package in the root directory of source files will not 
                 do consistency check between the package name and file path, but
                 all source files must have the same specified package name.
 
  @Description:  Check that compiler will not do consistency check between source
                 files of root directory. 
                 
  @Mode:         run 

  @Negative:     no  
 
  @Comment:      This test uses custom driver `custom.py`. Files a.cj and b.cj have 
                 same  package name and different paths but since this source files
                 are parts of root directory compiler should not throw any error.
*/

package def
import utils.assert.Assert

main() {
    Assert.equals(3.14, PI)
    Assert.equals(9.8, G)
}
