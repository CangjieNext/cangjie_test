/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_02_01_a01_01

  @Level:         1

  @Assertion:     5.1.2.1(1) When defining a function, add ! to the end of a parameter name to define the named 
                  parameter. 
    namedParameter 
        : identifier '!' ':' type 
        ;  

  @Description:   Check that rigth syntax doesn't produce an error.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

interface myInterface { 
  static func f(a!: String): String {
    a
  }
} 

public func f1<T>(x!: T) {
  if(x is Int64){
    return "x is Int64"
  }
  return "x is not Int64"
}

func f2(a:Int64, b!:Int64) {
  return a/b
}

func f3(a:Float16, b!:Float16 = 2.0) {
  func f4(c!: Float16, d!:Float16) {
    return c/d
  }
  f4(c: a, d: b)
}

class myClass  {
  func getValues(a!: Int32): String {
    a.toString()
  }
}

struct myStruct {
  func structFunc(a!: Int32, b!: Int32, c!: Bool): Int32 {
    if(c){
      a + b
    } else {
      a - b
    }
  }
}

enum myEnum {
  A

  func enumFunc(y: String, x!: Int32): String {
    " ${y} ${x.toString()}"
  }
}

main() {
  Assert.equals("myString",myInterface.f(a: "myString"))
  var inVal: Int64 = 8
  Assert.equals("x is Int64", f1(x: inVal))
  Assert.equals("x is not Int64", f1(x: 'C'))
  Assert.equals(3, f2(12, b: 4))
  Assert.equals(6.3, f3(12.6, b: 2.0))

  var myClassImpl = myClass()
  Assert.equals("5", myClassImpl.getValues(a: 5))

  var myStructImpl = myStruct()
  Assert.equals(22, myStructImpl.structFunc(a: 5, b: 17, c: true))
  Assert.equals(-12, myStructImpl.structFunc(a: 5, b: 17, c: false))

  Assert.equals(" request 12", myEnum.A.enumFunc("request", x: 12))
}
