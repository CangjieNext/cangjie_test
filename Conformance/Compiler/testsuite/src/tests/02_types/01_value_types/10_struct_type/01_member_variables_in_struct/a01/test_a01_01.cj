/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_01_a01_01

  @Level:         1

  @Assertion:   2.1.10.1(1) The syntax for the definition of member variables is:
                 variableDeclaration
                  : variableModifier* NL* (LET | VAR) 
                    NL* patternsMaybeIrrefutable ((NL* COLON NL* type)? (NL* ASSIGN NL* expression) 
                  | (NL* COLON NL* type))
                  ;

  @Description: Check that correctly defined member variables in struct, 
                according to rules above, do not produce error on compilation.

  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

enum MyEnum {
    item1
    |
    item2
    |
    item3
}

struct MyStruct {
    public let letPubWithoutTypeAssign = 0;
    public let letPubWithoutTypeAssignExpession = (letPubWithoutTypeAssign == 1);

    public let letPubWithTypeAssign: String = "111";
    public let letPubWithTypeAssignExpession: Bool = (letPubWithTypeAssign == letPubWithTypeAssign);

    public let _let_Pub_Wildcard_WithType_Assign: Float32 = 1.5f32;

    public let letPubWithTupleTypeAssign: (Int32, Float16, Rune, Bool, String) = 
        (1i32, 2.5f16, r'a', (1 == 1), "ss");;

    public let letPubWithEnumTypeAssign: MyEnum = MyEnum.item2;


    public var varPubWithoutTypeAssign = 0;
    public var varPubWithoutTypeAssignExpession = (varPubWithoutTypeAssign == 1);

    public var varPubWithTypeAssign: String = "111";
    public var varPubWithTypeAssignExpession: Bool = (varPubWithTypeAssign == varPubWithTypeAssign);

    public var _var_Pub_Wildcard_WithType_Assign: Float32 = 1.5f32;

    public var varPubWithTupleTypeAssign: (Int32, Float16, Rune, Bool, String) = 
        (1i32, 2.5f16, r'a', (1 == 1), "ss");;

    public var varPubWithEnumTypeAssign: MyEnum = MyEnum.item2;
}


main() {
}


