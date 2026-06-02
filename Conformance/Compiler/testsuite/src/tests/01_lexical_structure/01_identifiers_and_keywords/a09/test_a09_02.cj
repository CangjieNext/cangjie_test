/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a09_02

  @Level:         1

  @Assertion:    1.1(9) Contextual Keywords are special strings that can be used
                 as identifiers; they exist as keywords in some syntaxes, but
                 can also be used as normal identifiers.

  @Description:  Check that contextual keywords are allowed as raw identifiers.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
    var `abstract` : Int32 = 1
    var `open` : Int32 = 2
    var `override` : Int32 = 3
    var `private` : Int32 = 4
    var `protected` : Int32 = 5
    var `public` : Int32 = 6
    var `redef` : Int32 = 7
    var `get` : Int32 = 8
    var `set` : Int32 = 9
    var `sealed` : Int32 = 10
}
