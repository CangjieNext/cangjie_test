/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_08_a01_01

  @Level:         1
  @Assertion:   A.2.3.8(1)
                extendDefinition
                    : EXTEND NL* extendType
                    (NL* UPPERBOUND NL* superInterfaces)? (NL* genericConstraints)?
                    NL* extendBody
                    ;
                extendType
                    : (identifier NL* DOT NL*)* identifier (NL* typeParameters)?
                    | INT8
                    | INT16
                    | INT32
                    | INT64
                    | INTNATIVE
                    | UINT8
                    | UINT16
                    | UINT32
                    | UINT64
                    | UINTNATIVE
                    | FLOAT16
                    | FLOAT32
                    | FLOAT64
                    | CHAR
                    | BOOLEAN
                    | NOTHING
                    | UNIT
                    ;
                extendBody
                    : LCURL end* extendMemberDeclaration* end* RCURL
                    ;
                extendMemberDeclaration
                    : (functionDefinition
                    | operatorFunctionDefinition
                    | macroExpression
                    | associatedTypeDefinition
                    | propertyDefinition
                    ) end*
                    ;

  @Description: Check some extention definitions.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
  @Issue:       6524
*/

struct S1 { }

extend S1 {
    func foo() { }
}

extend Int8 {
    func foo() { }
}
extend Int16 {
    func foo() { }
}
extend Int32 {
    func foo() { }
}
extend Int64 {
    func foo() { }
}
extend IntNative {
    func foo() { }
}

extend UInt8 {
    func foo() { }
}
extend UInt16 {
    func foo() { }
}
extend UInt32 {
    func foo() { }
}
extend UInt64 {
    func foo() { }
}
extend UIntNative {
    func foo() { }
}

extend Float16 {
    func foo() { }
}
extend Float32 {
    func foo() { }
}
extend Float64 {
    func foo() { }
}

extend Rune {
    func foo() { }
}
extend Bool {
    func foo() { }
}
extend Nothing {
    func foo() { }
}
extend Unit {
    func foo() { }
}

extend String {
    func foo() { }
}

main() {
    return 0
}