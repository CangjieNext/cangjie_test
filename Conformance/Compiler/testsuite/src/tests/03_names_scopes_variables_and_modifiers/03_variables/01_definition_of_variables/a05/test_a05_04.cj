/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a05_04

  @Level:         1

  @Assertion:    3.3.1(5) The modifiers of member variables of the class type are as follows: 
                 public, protected, private, static.

  @Description:  Check that mutable class member not initialized variables declaration can include modifiers: 
                 public, protected, private.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    public var classVarPublic: Int32
    protected var classVarProtected: Int32
    private var classVarPrivate: Int32
    var classVar: Int32
  
    MyClass(x: Int32) {
        classVarPublic = x
        classVarProtected = x+1 
        classVarPrivate = x+2 
        classVar = x+3
    }
}

main() {
}