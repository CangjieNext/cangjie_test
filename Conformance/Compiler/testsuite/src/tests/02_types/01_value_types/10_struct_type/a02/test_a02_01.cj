/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a02_01

  @Level:         1

  @Assertion:   2.1.10(2) The following grammar shows the definition of struct types:
                 structDefinition
                  : structModifier? 'struct' identifier typeParameters? ('<:' superInterfaces)? 
                    genericConstraints? structBody
                  ;
  
                 structBody
                  : '{'
                   structMemberDeclaration*
                   structPrimaryInit?
                   structMemberDeclaration*
                  '}'
                  ;
  
                 structMemberDeclaration
                  : structInit
                  | staticInit
                  | variableDeclaration
                  | functionDefinition
                  | operatorFunctionDefinition
                  | macroExpression
                  | propertyDefinition
                  ;

                In above, structModifier indicates the modifier of struct, and struct is the keyword, 
                and identifier is the name of the struct type. 
                typeParameters and genericConstraints are list of type variables 
                and their constraints (refer to chapter 9 for generics), respectively.

  @Description: Check that correctly defined structs, according to rules above, are compiled correctly.

  @Mode:        compileOnly
  @Negative:    yes
  @Structure:   single
*/

public struct TestA0201 {
    var member: Int32 = 1;
}

struct Struct02<T1, T2> {
    var member1: T1;
    var member2: T2;
    init(member1: T1, member2: T2) {
        this.member1 = member1;
        this.member2 = member2;
    };
}

interface Interface03 {};
struct Struct03 <: Interface03 {
    var member: Int32 = 1;
}

interface Interface04 {};
struct Struct04<T1, T2> where T1 <: Interface03, T2 <: Interface04 {
    var member1: T1;
    var member2: T2;
    init(member1: T1, member2: T2) {
        this.member1 = member1;
        this.member2 = member2;
    };
}

struct Struct05 {
    var member1: Int32;
    public Struct05(param: Int32) {
        this.member1 = param;
    }

    var member2: Int8 = 2;
}

struct Struct06 {
    var varMember1: Int32;
    var varMember2: Bool = true;
    var varMember3: String = "s1";

    init(varMember1: Int32) {
        this.varMember1 = varMember1;
    };

    func function1(param: Int32): Int32 { return param + varMember1; }
    func function2(param: Bool): Bool { return param == varMember2; }
    func function3(param: String): String { return param + varMember3; }
}

struct Struct07 {
    var member: Int32;
    public Struct07(param: Int32) {
        this.member = param;
    }

    operator func -() {
        return 1;
    }
}

struct Struct08 {
    prop let prop1: Rune {
        get() {
            r'A'
        }
    }

    var propVar: Bool = false
    public prop var prop2: Bool {
        get() {
            propVar;
        }
        set(toSet) {
            propVar = toSet;
        }
    }
}

struct Struct09 {
    var v1 = 2;
    var v2 = 3;

    operator func()() {
        return 1;
    }

    operator func -() {
      return Struct09().v2 - Struct09().v2;
    }

    operator func[](index: Int64) {
      return index;
    }

    operator func *(s: Struct09) {
       return s.v1 * s.v2;
    }
}

main() {
}


