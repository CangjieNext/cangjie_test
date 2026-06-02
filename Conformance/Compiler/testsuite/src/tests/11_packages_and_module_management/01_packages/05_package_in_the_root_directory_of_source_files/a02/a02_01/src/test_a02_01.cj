/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         11_01_05_a02_01

  @Level:         1

  @Assertion:    11.1.5(2) These files can declare any legal package name.
 
  @Description:  Check that package with program entry can have custom name. 
                 
  @Mode:         run 

  @Negative:     no  
 
  @Comment:      This test uses custom driver `custom.py`. 
*/

package customname

main() {
    print("Hello, world!")
    return 0
}