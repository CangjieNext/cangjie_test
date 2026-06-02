// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

foreign func PassToCVoid(): Int32

func PassVoidAndReturnInt32():Int64
{
  var ret = unsafe { PassToCVoid() }
  if (ret == 3) {
    return 0
  }
  return 1
}

main():Int64 {
  return PassVoidAndReturnInt32()
}
