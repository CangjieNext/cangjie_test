/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_a01_01

  @Level:         1

  @Assertion:    11.1.5(1) The root directory of source files is the package
                 where the module’s program entry is located, which can have more than
                 one source file.
 
  @Description:  Check that compiler won't throw any errors on package with multiple source
                 files and one program entry. 
                 
  @Mode:         run 

  @Negative:     no  
 
  @Comment:      This test use custom driver `custom.py`. 
*/

import utils.assert.Assert

main() {
    Assert.equals("foo", foo())
    Assert.equals("Hello, World!", hw())
}