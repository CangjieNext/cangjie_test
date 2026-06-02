/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_02_a01_01

  @Level:         1
  @Assertion:   A.2.2(1) 
                preamble
                    : packageHeader? importList*
                    ;
                packageHeader
                    : PACKAGE NL* packageNameIdentifier end+
                    ;
                packageNameIdentifier
                    : identifier (NL* DOT NL* identifier)*
                    ;
                importList
                    : (FROM NL* identifier)? NL* IMPORT NL* importAllOrSpecified
                    (NL* COMMA NL* importAllOrSpecified)* end+
                    ;
                importAllOrSpecified
                    : importAll
                    | importSpecified (NL* importAlias)?
                    ;
                importSpecified
                    : (identifier NL* DOT NL*)+ identifier
                    ;
                importAll
                    : (identifier NL* DOT NL*)+ MUL
                    ;
                importAlias
                    : AS NL* identifier
                    ;


  @Description: Check trivial preamble declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        run
  @Negative:    no
  @Structure:   complex-main
  @Dependencies: aux_01.cj aux_02.cj aux_03.cj
*/

package pkg01

import utils.assert.Assert

import pkg02
import pkg02

.

*

import pkg03.foo3
import pkg03


main() {
  Assert.equals("foo", foo())
  Assert.equals("foo2", foo2())
  Assert.equals("foo2", pkg02.foo2())
  Assert.equals("foo3", foo3())
  Assert.equals("foo3", pkg03.foo3())
  return 0
}
