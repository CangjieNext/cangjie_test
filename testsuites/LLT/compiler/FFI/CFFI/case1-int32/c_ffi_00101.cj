// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

foreign func PassToCInt32(x:Int32): Int32
foreign func PassToCUIntNative(x: UIntNative): UIntNative
foreign func PassToCIntNative(x: IntNative): IntNative

func PassAndReturnInt32():Int64
{
  var ret = unsafe { PassToCInt32(3) }
  if (ret == 3) {
    return 0
  }
  return 1
}

func PassAndReturnUIntNative():Int64
{
  var ret = unsafe { PassToCUIntNative(3) }
  if (ret == 3) {
    return 0
  }
  return 1
}

func PassAndReturnIntNative():Int64
{
  var ret = unsafe { PassToCIntNative(3) }
  if (ret == 3) {
    return 0
  }
  return 1
}

main():Int64 {
  var a = PassAndReturnInt32() + PassAndReturnUIntNative() + PassAndReturnIntNative()
  return a
}
