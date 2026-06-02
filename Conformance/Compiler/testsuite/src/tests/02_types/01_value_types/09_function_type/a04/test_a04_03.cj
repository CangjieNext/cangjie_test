/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_09_a04_03

  @Level:         1

  @Assertion:   2.1.9(4) The () outside of the parameter type list is mandatory, in which zero or 
                  multiple types can be included (multiple types are separated by ,).

  @Description: Checks that function type, declared with the '{}' outside of the parameter 
                type list instead of '()', causes compilation error;

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

type funcType = {Rune, Rune} -> Rune;

main() {
    return 0;
}

