/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:      04_04_01_05_a04_02

  @Level:         1

  @Assertion: 4.4.1.5(4) Afterwards, the variable is bound with the varBindingPattern on the left of : (no bound exists
              for wildcardPattern : type).

  @Description: Checks that an attempt to modify value of the variable which is bound with the varBindingPattern
                causes a compilation error like in the binding pattern.
  @Mode: compileonly
  @Negative: yes
  @Structure: single
  @CompileWarning: no

*/

main() {
    var v = 123
    match (v) {
        case foo => foo++
    }
    return
}
