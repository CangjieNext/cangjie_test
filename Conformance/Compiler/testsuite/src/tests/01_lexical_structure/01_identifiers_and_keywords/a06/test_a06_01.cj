/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         01_01_a06_01

  @Level:         1

  @Assertion:    1.1(6) The syntax of Identifier is defined as:
                       identifier
                           : Identifier
                           | PUBLIC
                           | PRIVATE
                           | PROTECTED
                           | OVERRIDE
                           | ABSTRACT
                      | SEALED
                           | OPEN
                           | REDEF
                           | GET
                           | SET
                           ;
                       Identifier
                           : '_'* Letter (Letter | '_' | DecimalDigit)*
                           | '`' '_'* Letter (Letter | '_' | DecimalDigit)* '`'
                           ;
                       Letter
                           : [a-zA-Z]
                           ;
                       DecimalDigit
                           : [0-9]
                           ;

  @Description:  Check using special strings as identifiers.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

main() {
    var PUBLIC: Int32 = 0
    var PRIVATE: Int32 = 0
    var PROTECTED: Int32 = 0
    var OVERRIDE: Int32 = 0
    var ABSTRACT: Int32 = 0
    var SEALED: Int32 = 0
    var OPEN: Int32 = 0
    var REDEF: Int32 = 0
    var GET: Int32 = 0
    var SET: Int32 = 0

    var _ABCDEF_: Int32 = 0
    var _ABCDEF_12345: Int32 = 0
    var `_ABCDEFG_`: Int32 = 0
    var `_ABCDEGF_12345`: Int32 = 0
}
