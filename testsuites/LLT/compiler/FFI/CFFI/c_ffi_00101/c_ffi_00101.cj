// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %f %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

foreign func PassToCBool(x: Bool): Bool
foreign func PassToCInt8(x: Int8): Int8
foreign func PassToCInt16(x: Int16): Int16
foreign func PassToCInt32(x: Int32): Int32
foreign func PassToCInt64(x: Int64): Int64
foreign func PassToCUInt8(x: UInt8): UInt8
foreign func PassToCUInt16(x: UInt16): UInt16
foreign func PassToCUInt32(x: UInt32): UInt32
foreign func PassToCUInt64(x: UInt64): UInt64

func testAllPrimitives(): Int64
{
  let inputBool = false
  let resBool = unsafe { PassToCBool(inputBool) }
  if (!resBool) {
    return 1
  }

  let inputInt8: Int8 = 2
  let resInt8 = unsafe { PassToCInt8(inputInt8) }
  if (resInt8 != inputInt8 * 2) {
    return 1
  }

  let inputInt16: Int16 = 4
  let resInt16 = unsafe { PassToCInt16(inputInt16) }
  if (resInt16 != inputInt16 * 2) {
    return 1
  }

  let inputInt32: Int32 = 8
  let resInt32 = unsafe { PassToCInt32(inputInt32) }
  if (resInt32 != inputInt32 * 2) {
    return 1
  }

  let inputInt64: Int64 = 16
  let resInt64 =  unsafe { PassToCInt64(inputInt64) }
  if (resInt64 != inputInt64 * 2) {
    return 1
  }

  let inputUInt8: UInt8 = 2
  let resUInt8 =  unsafe { PassToCUInt8(inputUInt8) }
  if (resUInt8 != inputUInt8 * 2) {
    return 1
  }

  let inputUInt16: UInt16 = 4
  let resUInt16 =  unsafe { PassToCUInt16(inputUInt16) }
  if (resUInt16 != inputUInt16 * 2) {
    return 1
  }

  let inputUInt32: UInt32 = 8
  let resUInt32 =  unsafe { PassToCUInt32(inputUInt32) }
  if (resUInt32 != inputUInt32 * 2) {
    return 1
  }

  let inputUInt64: UInt64 = 16
  let resUInt64 =  unsafe { PassToCUInt64(inputUInt64) }
  if (resUInt64 != inputUInt64 * 2) {
    return 1
  }

  return 0
}

main():Int64 {
  return testAllPrimitives()
}
