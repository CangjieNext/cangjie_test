/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:        02_01_10_a03_01

  @Level:         1

  @Assertion:   2.1.10(3) In the structBody, it is allowed to define member variables (variableDeclaration), 
                member properties (propertyDefinition), primary constructor (structPrimaryInit), 
                constructor functions (structInit) and member functions 

  @Description: Checks that the structs, defined with using variableDeclaration,
                structInit, structPrimaryInit, member functions and propertyDefinition
                are compiled correctly.

  @Mode:        compileOnly
  @Negative:    no
  @Structure:   single

  @Issue: 0006124

*/

// variableDeclaration
public struct TestA0301 {
    var member1: Int32 = 1;
    var member2: Rune = r'1';
    let member3: String = "1";
    let member4: Bool = true;
}

// variableDeclaration and structInit
struct Struct02 {
    var member1: Int64;
    var member2: String;
    init(member1: Int64, member2: String) {
        this.member1 = member1;
        this.member2 = member2;
    };
}

// variableDeclaration and structPrimaryInit
struct Struct03 {
    var member: Int32;
    public Struct03(param: Int32) {
        this.member = param;
    }
}

// variableDeclaration, structInit and member functions
struct Struct04 {
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

// propertyDefinition
struct Struct05 {
    prop prop1: Rune {
        get() {
            r'A'
        }
    }

    var propVar: Bool = false
    public mut prop prop2: Bool {
        get() {
            propVar;
        }
        set(toSet) {
            propVar = toSet;
        }
    }
}

main() {
    var structVar01: TestA0301 = TestA0301();
    var structVar02: Struct02 = Struct02(10, "Str");
    var structVar03: Struct03 = Struct03(11);
    var structVar04: Struct04 = Struct04(11);
    var structVar05: Struct05 = Struct05();
}


