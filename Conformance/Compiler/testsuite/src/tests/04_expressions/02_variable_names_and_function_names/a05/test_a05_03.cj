/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:      04_02_a05_03

  @Level:         1

  @Assertion: 4.2(5) For variable names, it is specified that variables 
              declared by var are always mutable and that variables 
              declared by let may only be assigned once (at or after its 
              declaration), before the assignment it is mutable and after the
              assignment it is immutable.
  @Description: Checks that global variable declared by let cannot be assigned
                twice.
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

let i = 1

main() {
    i = 2
    return
}
