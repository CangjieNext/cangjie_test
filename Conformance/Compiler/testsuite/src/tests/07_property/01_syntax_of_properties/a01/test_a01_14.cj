/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        07_01_a01_14

  @Level:         1

  @Assertion:   7.1(1) The syntax rule for the properties is :
                propertyDefinition
                : propertyModifier* 'prop' identifier ':' type propertyBody?
                ;
                propertyBody
                : '{' propertyMemberDeclaration+ '}'

                propertyMemberDeclaration
                : 'get' '(' ')' block end*
                | 'set' '(' identifier ')' block end*
                ;
                propertyModifier
                : 'public'
                | 'private'
                | 'protected'
                | 'static'
                | 'open'
                | 'override'
                | 'redef'
                | 'mut'
                ;

  @Description: Checks that mutable property with getter & setter is ok.

  @Mode:        compileonly
  @Negative:    no
  @Structure:   single
  @Issue:       0006124

*/

class A {
  mut prop aaa : Int32 {
    get() { 0 }
    set(v) {}
  }
}

main() {
    return 0;
}


