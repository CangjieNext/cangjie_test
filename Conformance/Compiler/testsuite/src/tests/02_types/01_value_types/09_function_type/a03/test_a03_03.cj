/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_09_a03_03

  @Level:         1

  @Assertion:   2.1.9(3) The parameter type list (i.e., parameterTypes) and the return value type 
                  (i.e., type) are linked using ->.


  @Description: Checks that function type, declared with ':' instead '->' 
                causes compilation error;

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single

*/

type funcType = (Bool, Rune) : String;

main() {
    return 0;
}

