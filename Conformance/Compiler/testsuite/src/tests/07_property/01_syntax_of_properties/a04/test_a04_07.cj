/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a04_07

  @Level:         1

  @Assertion:   7.1(4) Numeric types, Bool, Unit, Nothing, Rune, String, Range, Function,
                Enum,Tuple type may not define properties with mut modifier.

  @Description: Checks that Rune type cannot be extended with mutable property.

  @Mode:        compileonly
  @Negative:    yes
  @Structure:   single
  @Issue:       0006124


*/

extend Rune {
  mut prop val: Int64 {
    get() { 0 }
    set(v) { }
  }
}

main() {
  return 0;
}


