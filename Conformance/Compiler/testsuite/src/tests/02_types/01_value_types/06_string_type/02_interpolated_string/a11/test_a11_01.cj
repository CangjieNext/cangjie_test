/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         02_01_06_02_a11_01

  @Level:         1

  @Assertion:    2.1.6.2(11) The types described above all implement the ToString interface.

  @Description:  Check that types described above all implement the ToString interface.

  @Mode:         run

  @Negative:     no

  @Structure:    single

  @Comment:      

*/
import utils.assert.Assert
main() {
  var myInt8Var: Int8 = 8
  var myInt16Var: Int16 = 16
  var myInt32Var: Int32 = -32
  var myInt64Var: Int64 = -64
  var myIntNativeVar: IntNative = 64
 
  var myUInt8Var: UInt8 = 8
  var myUInt16Var: UInt16 = 16
  var myUInt32Var: UInt32 = 32
  var myUInt64Var: UInt64 = 64
  var myUIntNativeVar: UIntNative = 64

  var myFloat16Var: Float16 = 16.0
  var myFloat32Var: Float32 = 32.12
  var myFloat64Var: Float64 = 64.111

  let myByteVar: Byte = myUInt8Var
  let myCharVar: Rune = 'S'
  let myBoolVar: Bool = true

  var myToStringVar: ToString

  Assert.isTrue(myInt8Var is ToString)
  myToStringVar = myInt8Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myInt16Var is ToString)
  myToStringVar = myInt16Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myInt32Var is ToString)
  myToStringVar = myInt32Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myInt64Var is ToString)
  myToStringVar = myInt64Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myIntNativeVar is ToString)
  myToStringVar = myIntNativeVar
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myUInt8Var is ToString)
  myToStringVar = myUInt8Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myUInt16Var is ToString)
  myToStringVar = myUInt16Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myUInt32Var is ToString)
  myToStringVar = myUInt32Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myUInt64Var is ToString)
  myToStringVar = myUInt64Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myUIntNativeVar is ToString)
  myToStringVar = myUIntNativeVar
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myFloat16Var is ToString)
  myToStringVar = myFloat16Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myFloat32Var is ToString)
  myToStringVar = myFloat32Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myFloat64Var is ToString)
  myToStringVar = myFloat64Var
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myByteVar is ToString)
  myToStringVar = myByteVar
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myCharVar is ToString)
  myToStringVar = myCharVar
  Assert.isTrue(myToStringVar is ToString)

  Assert.isTrue(myBoolVar is ToString)
  myToStringVar = myBoolVar
  Assert.isTrue(myToStringVar is ToString)
}