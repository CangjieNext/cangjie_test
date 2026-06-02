/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a05_03

  @Level:         1

  @Assertion:    3.3.1(5) The modifiers of member variables of the class type are as follows: 
                 public, protected, private, static.

  @Description:  Check that mutable class member initialized variables can include modifiers: 
                 public, protected, private, static.

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class MyClass {
    static public var classVarStaticPublic: Int32 = 0
    public var classVarPublic: Int32 = 0
    static protected var classVarStaticProtected: Int32 = 1
    protected var classVarProtected: Int32 = 1
    static private var classVarStaticPrivate: Int32 = 2
    private var classVarPrivate: Int32 = 2
    static var classVarStatic: Int32 = 3
    var classVar: Int32 = 4
}

main() {
}