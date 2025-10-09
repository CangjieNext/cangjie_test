/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name: 06_01_02_01_a34_073

  @Level:         1

  @Assertion: 6.1.2.1(34)
              A constructor has the following dedicated syntax.
              structInitDeclaration
                  : annotationList? (structNonStaticMemberModifier | CONST NL*)? INIT NL* functionParameters NL* block
                  ;
 
              classInitDeclaration
                  : annotationList? (classNonStaticMemberModifier | CONST NL*)? INIT NL* functionParameters NL* block
                  ;

  @Description: Check that the parameter list can end in a trailing ',' symbol

  @Mode: run

  @Negative: no

  @Structure: single
*/

class _fh931 {
  init(a: String, b: Bool, c!: Int64,) {}
}

main() {
}