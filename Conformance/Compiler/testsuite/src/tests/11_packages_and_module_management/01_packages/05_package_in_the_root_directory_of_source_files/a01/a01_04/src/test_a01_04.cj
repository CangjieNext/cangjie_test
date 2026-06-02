/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_a01_04

  @Level:         1

  @Assertion:    11.1.5(1) The root directory of source files is the package
                 where the module’s program entry is located, which can have more than
                 one source file.
 
  @Description:  Check that root directory of source files cannot have multiple program entries
                 in different files. 
                 
  @Mode:         compileonly 

  @Negative:     yes  
 
  @Comment:      This test uses custom driver `custom.py`. 
*/

package default

main() {
    return 0
}
