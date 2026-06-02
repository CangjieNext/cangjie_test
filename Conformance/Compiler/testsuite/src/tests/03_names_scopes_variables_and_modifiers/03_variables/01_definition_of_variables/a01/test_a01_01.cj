/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a01_01

  @Level:         1

  @Assertion:    3.3.1(1) 
  The syntax of variable definition is as follows. 
    variableDeclaration 
         : variableModifier* ('let' | 'var') patternsMaybeIrrefutable ( (':' type)? ('=' expression) 
         | (':' type)) 
         ; 
    variableDeclaration 
    patternsMaybeIrrefutable 
         : wildcardPattern 
         | varBindingPattern 
         | tuplePattern 
         | enumPattern 
         ; 

  @Description:  Check that variable declaration using right syntax will not produce error on compilation.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single
*/

public let myPublicTopLetNotDefinedInitialized = 0
public var myPublicTopVarNotDefinedInitialized = 0
public let myPublicTopLetInt64Initialized: Int64 = 0
public var myPublicTopVarInt64Initialized: Int64 = 0
public let myPublicTopLetTupleInitialized = (0,"AAA")
public var myPublicTopVarTupleInitialized = (0,"BBB")

let myTopLetNotDefinedInitialized = 0
var myTopVarNotDefinedInitialized = 0
let myTopLetInt64Initialized: Int64 = 0
var myTopVarInt64Initialized: Int64 = 0
let myTopLetTupleInitialized = (0,"AAA")
var myTopVarTupleInitialized = (0,"BBB")

class MyClass{
    public let letPublicInitialisedInt32: Int32 = 12
    public let letPublicNotInitialisedInt32: Int32
    public var varPublicInitialisedInt32: Int32 = 12
    public var varPublicNotInitialisedInt32: Int32
    protected let letProtectedInitialisedInt32: Int32 = 12
    protected let letProtectedNotInitialisedInt32: Int32
    protected var varProtectedInitialisedInt32: Int32 = 12
    protected var varProtectedNotInitialisedInt32: Int32
    private let letPrivateInitialisedInt32: Int32 = 12
    private let letPrivateNotInitialisedInt32: Int32
    private var varPrivateInitialisedInt32: Int32 = 12
    private var varPrivateNotInitialisedInt32: Int32
    let letInitialisedInt32: Int32 = 12
    let letNotInitialisedInt32: Int32
    var varInitialisedInt32: Int32 = 12
    var varNotInitialisedInt32: Int32

    MyClass(inVal: Int32){
        this.letPublicNotInitialisedInt32 = inVal
        this.varPublicNotInitialisedInt32 = inVal
        this.letProtectedNotInitialisedInt32 = inVal
        this.varProtectedNotInitialisedInt32 = inVal
        this.letPrivateNotInitialisedInt32 = inVal
        this.varPrivateNotInitialisedInt32 = inVal
        this.letNotInitialisedInt32 = inVal
        this.varNotInitialisedInt32 = inVal
    }

    func changeVal(inVal: Int32) {
        this.varPublicInitialisedInt32 = inVal
        this.varPublicNotInitialisedInt32 = inVal
        this.varProtectedInitialisedInt32 = inVal
        this.varProtectedNotInitialisedInt32 = inVal
        this.varPrivateInitialisedInt32 = inVal
        this.varPrivateNotInitialisedInt32 = inVal
        this.varInitialisedInt32 = inVal
        this.varNotInitialisedInt32 = inVal
    }
}

main() {
    let myLetInt64Initialized: Int64 = 0
    var myVarInt64Initialized: Int64 = 0
    let myLetNotDefinedInitialized = 0
    var myVarNotDefinedInitialized = 0
    let myLetInt64NotInitialized: Int64
    var myVarInt64NotInitialized: Int64
    let myLetTupleInitialized = (0,"AAA")
    var myVarTupleInitialized = (0,"BBB")

    myLetInt64NotInitialized = 0
    myVarInt64NotInitialized = 0

    let myClass1 = MyClass(22)
    myClass1.changeVal(33)
    var myClass2 = MyClass(45)
    myClass1.changeVal(65)
}