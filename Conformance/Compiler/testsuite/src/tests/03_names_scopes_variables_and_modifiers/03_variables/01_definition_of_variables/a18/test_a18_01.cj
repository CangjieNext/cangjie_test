/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a18_01

  @Level:         1

  @Assertion:    3.3.1(18) The keyword let/varand the pattern are mandatory.

  @Issue:        6526

  @Description:  Check that mutable variable definition is possible with and without a variable type

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

public var myPublicTopVar = 127.1
var myTopVar = -16

class MyClass {
    static public var myStaticPublicClassMemberVar = (127, 'G')
    public var myPublicClassMemberVar = "127"
    public var myPublicClassMemberVarWithType: String = "127"
    static private var myStaticPrivateClassMemberVar = 1..27:2
    private var myPrivateClassMemberVar = 127
    private var myPrivateClassMemberVarWithType: Int32 = 127
    static protected var myStaticProtectedClassMemberVar = -7.3
    protected var myProtectedClassMemberVar = 100.103
    protected var myProtectedClassMemberVarWithType: Float16 = 0.123
    static var myStaticClassMemberVar = 1.6
    var myClassMemberVar = "kjhgsd"
}

struct Triangle { 
    static var myStaticVar = 'T' 
    static public var myStaticPublicVar = -10 
    public var myPublicVar = "kkdfs" 
    var myVar = 10 
} 

main() {
    var myLocalVar = -1.02
    var myLocalVarWithType: Range<Int32> = 1..5:1
}
