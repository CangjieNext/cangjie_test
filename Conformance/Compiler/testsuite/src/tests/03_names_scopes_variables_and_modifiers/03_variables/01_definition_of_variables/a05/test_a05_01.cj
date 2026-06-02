/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a05_01

  @Level:         1

  @Assertion:    3.3.1(5) The modifiers of member variables of the class type are as follows: 
                 public, protected, private, static.

  @Description:  Check that immutable class member initialized variables can include modifiers: 
                 public, protected, private, static.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    static public let classLetStaticPublic: Int32 = 22
    public let classLetPublic: Int32 = 0
    static protected let classLetStaticProtected: Int32 =23 
    protected let classLetProtected: Int32 = 1
    static private let classLetStaticPrivate: Int32 = 24
    private let classLetPrivate: Int32 = 2
    static let classLetStatic: Int32 = 3
    let classLet: Int32 = 4
}

main() {
}