/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a05_02

  @Level:         1

  @Assertion:    3.3.1(5) The modifiers of member variables of the class type are as follows: 
                 public, protected, private, static.

  @Description:  Check that immutable class member not initialized variables declaration can include modifiers: 
                 public, protected, private.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    public let classLetPublic: Int32
    protected let classLetProtected: Int32
    private let classLetPrivate: Int32
    static let classStaticLet: Int32 = 25
    let classLet: Int32
  
    MyClass(x: Int32) {
        classLetPublic = x
        classLetProtected = x+1 
        classLetPrivate = x+2 
        classLet = x+3
    }
}

main() {
}