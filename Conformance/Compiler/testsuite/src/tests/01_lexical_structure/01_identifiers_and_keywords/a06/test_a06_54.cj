/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:            01_01_a06_54

  @Level:         1

  @Assertion:       1.1(6) The syntax of Identifier is defined as:
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

  @Description:     Check that identifiers can start with _.

  @Mode:            compileonly
  @Negative:        no
  @Structure:       single
*/

main() {
    let _aa = 0
    let _a_ = 0
    let _a1 = 0
    let _aBC = 0
    let _ah_ = 0
    let _ah5 = 0
    let _a_p = 0
    let _a__ = 0
    let _a_0 = 0
    let _a6a = 0
    let _a6_ = 0
    let _a60 = 0

    let __aa = 0
    let __a_ = 0
    let __a1 = 0
    let __aBC = 0
    let __ah_ = 0
    let __ah5 = 0
    let __a_p = 0
    let __a__ = 0
    let __a_0 = 0
    let __a6a = 0
    let __a6_ = 0
    let __a60 = 0

    let `_aaa` = 0
    let `_aa_` = 0
    let `_aa1` = 0
    let `_aaBC` = 0
    let `_aah_` = 0
    let `_aah5` = 0
    let `_aa_p` = 0
    let `_aa__` = 0
    let `_aa_0` = 0
    let `_aa6a` = 0
    let `_aa6_` = 0
    let `_aa60` = 0

    let `__aaa` = 0
    let `__aa_` = 0
    let `__aa1` = 0
    let `__aaBC` = 0
    let `__aah_` = 0
    let `__aah5` = 0
    let `__aa_p` = 0
    let `__aa__` = 0
    let `__aa_0` = 0
    let `__aa6a` = 0
    let `__aa6_` = 0
    let `__aa60` = 0
}
