/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a04_01

  @Level:         1

  @Assertion:   7.1(4) Numeric types, Bool, Unit, Nothing, Rune, String, Range, Function,
                Enum,Tuple type may not define properties with mut modifier.

  @Description: Checks that given types can be extended with immutable property.

  @Comment:     It is uncrear if extending of Tuple is allowed, see Bug 0006148
  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124, 0006148


*/

extend Int64 {
  prop val: Int64 {
    get() { 0 }
  }
}

extend Float64 {
  prop val: Int64 {
    get() { 0 }
  }
}

extend Bool {
  prop val: Int64 {
    get() { 0 }
  }
}

extend Unit {
  prop val: Int64 {
    get() { 0 }
  }
}

extend Nothing {
  prop val: Int64 {
    get() { 0 }
  }
}


extend Rune {
  prop val: Int64 {
    get() { 0 }
  }
}

extend String {
  prop val: Int64 {
    get() { 0 }
  }
}

extend<T> Range<T> {
  prop val: Int64 {
    get() { 0 }
  }
}

extend<T> Option<T> {
  prop val: Int64 {
    get() { 0 }
  }
}

main() {
  return 0;
}


