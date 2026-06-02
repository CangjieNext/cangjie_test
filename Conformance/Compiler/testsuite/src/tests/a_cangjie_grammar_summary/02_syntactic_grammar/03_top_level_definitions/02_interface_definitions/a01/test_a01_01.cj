/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        A_02_03_02_a01_01

  @Level:         1
  @Assertion:   A.2.3.2(1)
                interfaceDefinition
                    : (interfaceModifierList NL*)? INTERFACE NL* identifier
                    (NL* typeParameters NL*)?
                    (NL* UPPERBOUND NL* superInterfaces)?
                    (NL* genericConstraints)?
                    (NL* interfaceBody)
                    ;

                interfaceBody
                    : LCURL end* interfaceMemberDeclaration* end* RCURL
                    ;
                interfaceMemberDeclaration
                    : (functionDefinition
                    | operatorFunctionDefinition
                    | macroExpression
                    | propertyDefinition) end*
                    ;

                interfaceModifierList
                    : (interfaceModifier NL*)+
                    ;
                interfaceModifier
                    : PUBLIC
                    | OPEN
                    ;


  @Description: Check various interface declaration.
                Reference to other tests in additional_tests.txt.
  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single
*/

// Without optional parts
interface I1 {}

// With interfaceModifier
public interface I2 {}
interface I3 {}
public interface I4 {}
public interface I5 {}

// With typeParameters
interface I6<T> {}
interface I7<T1, T2> {}

// With superInterfaces
interface I8 <: I1 {}
interface I9 <: I1 & I3 & I7<String, Bool> {}

// With typeParameters and genericConstraints
interface I10<T1, T2> {}

// With interfaceModifier and typeParameters
public interface I11<T> {}
interface I12<T1, T2> {}
public interface I13<T1, T2, T3> {}

// With interfaceModifier and typeParameters and genericConstraints
public interface I14<T, U>  {}
interface I15<T, U>  {}
public interface I16<T, U>  {}

// With interfaceModifier and superInterfaces
interface I17 <: I1 {}
public interface I18 <: I5 & I11<Rune> {}

// With typeParameters and superInterfaces
interface I19<T> <: I6<T> {}
interface I20<T> <: I1 & I3 {}

// With typeParameters and superInterfaces and genericConstraints
interface I21<T1, T2> <: I1  {}
interface I22<U, V> <: I6<U> & I11<V>  {}

// All optional parts
interface I23<U, V> <: I1  {}
public interface I24<T> <: I2 & I11<T>  {}

// All optional parts with new lines (NL)
public

interface

I25

<T>


<:

I2





{}

main() {
    return 0
}