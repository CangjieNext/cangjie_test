/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_a11_01

  @Level:         1

  @Assertion:     5.1(11) A function definition must have a block (excluding the parameters) as its function body, 
                  which cannot be omitted.

  @Description:   Check that function definition with right syntax including required function body will not 
                  produce error.

  @Mode:          compileonly

  @Negative:      no

  @Structure:     single

*/

public func checkingFunc<T>(x: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

class myClass {
  public var myPublicVar = "myPublicVarValue"
  private var myPivateVar:Int32 = 12
  var myVar:Float32 = 2.0
  myClass(){}

  func myClassFunc(inVal:Float32){this.myVar = inVal}
  public func getValues(){
    
    
    
    
    
    """
    Values are:"""
  }
  private func myPrivateFunc(){
                                                                  "private => ${myPivateVar}"
  }
  protected func myProtectedFunc(){
    "myProtectedFunc"
  }
  static func myStaticFunc():Int32{
    
    
    12
  
  
  
  
  
  
  }
}
func myParentFunc(){
  func myChildFunc(){12} 
  return "${myChildFunc()}"
}
func myFuncRetInt64(a:Int64){a}
func myFuncRetInt32(a:Int32):Int32
{a}
func myFuncRetBool(a:Bool)
{a
}
func myFuncRetTyple(a:Bool)
{
  ('a',true,7.62)
}
func myFuncRetString()
{
  "agsdg"}
main() {
}
