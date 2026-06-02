/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_04_a02_01

  @Level:         1

  @Assertion:    3.4 (2) The modifier is usually placed at the front of the definition to indicate 
                 that the definition has certain characteristics.

  @Description:  Сheck that the modifier before the definition does not cause errors

  @Mode:         compileonly

  @Negative:     no

  @Structure:    single

*/

class AccessModifiers { 
    var a = 0             //default access modifier
    public var b = 0      //public access modifier
    protected var c = 0   //protected access modifier
    private var d = 0     //private access modifier
} 

open class OpenModifier { public open func f() { } } //open non-access modifier

class OverrideModifier <: OpenModifier {
    public override func f() { } //override non-access modifier
} 

open class StaticModifier {
    static func f() { } //static non-access modifier
}

class RedefModifier <: StaticModifier {
    redef static func f() { } //redef non-access modifier
}

abstract class AbstractModifier { } //abstract non-access modifier

foreign func foreignModifier(): Int64 //foreign non-access modifier

struct MutModifier { mut func f() { } }  //mut non-access modifier

class OperatorModifier { operator func -() {} } //operator non-access modifier 

main() {

}
