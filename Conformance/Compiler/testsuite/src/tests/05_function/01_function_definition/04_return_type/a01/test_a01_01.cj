/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:          05_01_04_a01_01

  @Level:         1

  @Assertion:     5.1.4(1) The return type of a function can be either 
                    • Any type described in Chapter 2 
                    • a tuple type, in which case multiple values can be returned at the same time in the form of a 
                    tuple.

  @Description:   Check that global function can have different return types.

  @Mode:          run

  @Negative:      no

  @Structure:     single

*/
import utils.assert.Assert

type myType = (Int32, Rune, Bool)
type myFuncType = (Int32, Int32) -> Int32

class myClass {}

struct myStruct {}

enum myEnum { A }

func funcUnit() {} 

func funcInt8(): Int8 { 
  var retVal: Int8 = 8
  retVal
} 

func funcInt16(): Int16 { 
  var retVal: Int16 = 8
  retVal
} 

func funcInt32(): Int32 { 
  var retVal: Int32 = 8
  retVal
} 

func funcInt64(): Int64 { 
  var retVal: Int64 = 8
  retVal
} 

func funcIntNative(): IntNative { 
  var retVal: IntNative = 8
  retVal
} 

func funcUInt8(): UInt8 { 
  var retVal: UInt8 = 8
  retVal
} 

func funcUInt16(): UInt16 { 
  var retVal: UInt16 = 8
  retVal
} 

func funcUInt32(): UInt32 { 
  var retVal: UInt32 = 8
  retVal
} 

func funcUInt64(): UInt64 { 
  var retVal: UInt64 = 8
  retVal
} 

func funcUIntNative(): UIntNative { 
  var retVal: UIntNative = 8
  retVal
} 

func funcFloat16(): Float16 { 
  var retVal: Float16 = 8.0
  retVal
} 

func funcFloat32(): Float32 { 
  var retVal: Float32 = 8.0
  retVal
} 

func funcFloat64(): Float64 { 
  var retVal: Float64 = 8.0
  retVal
} 

func funcChar(): Rune { 
  r'r'
} 

func funcString(): String { 
  "retVal"
} 

func funcBool(): Bool { 
  true
} 

func funcTuple(): myType { 
  (12, r'c', false)
} 

func funcClass(): myClass { 
  myClass()
} 

func funcStruct(): myStruct { 
  myStruct()
} 

func funcEnum(): myEnum { 
  myEnum.A
} 

func funcRange(): Range<Int64> {
  let range64: Range<Int64> = 0..10
  range64
}

func funcFunc(z!: Int32 = 2, y!: Int32 = 3): (Int32, Int32) -> Int32 { 
  return {x, y => x + y}
} 


main() {
  
  Assert.isTrue(funcUnit() is Unit)

  Assert.isTrue(funcInt8() is Int8)
  Assert.isTrue(funcInt16() is Int16)
  Assert.isTrue(funcInt32() is Int32)
  Assert.isTrue(funcInt64() is Int64)

  Assert.isTrue(funcIntNative() is IntNative)
  
  Assert.isTrue(funcUInt8() is UInt8)
  Assert.isTrue(funcUInt16() is UInt16)
  Assert.isTrue(funcUInt32() is UInt32)
  Assert.isTrue(funcUInt64() is UInt64)

  Assert.isTrue(funcUIntNative() is UIntNative)

  Assert.isTrue(funcFloat16() is Float16)
  Assert.isTrue(funcFloat32() is Float32)
  Assert.isTrue(funcFloat64() is Float64)

  Assert.isTrue(funcChar() is Rune)
  Assert.isTrue(funcString() is String)
  Assert.isTrue(funcBool() is Bool)
  Assert.isTrue(funcTuple() is myType)
  Assert.isTrue(funcClass() is myClass)
  Assert.isTrue(funcStruct() is myStruct)
  Assert.isTrue(funcEnum() is myEnum)

  Assert.isTrue(funcRange() is Range<Int64>)

  Assert.isTrue(funcFunc() is myFuncType)
  
}
