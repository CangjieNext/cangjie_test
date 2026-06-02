/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_02_a03_04

  @Level:         1

  @Assertion: 4.2(3) For a function name, its value is a closure (see Section 
              5.7), and its type is the corresponding function type.
  @Description: Checks that its impossible to assign a function name to the
                variable of inproper closure type. 
  @Mode: compileonly
  @Negative: yes
  @Structure: single

*/

func with_params(i: Int64, j: Int32, name: String) {}

main() {
    var func: () -> Unit = with_params
    return
}

