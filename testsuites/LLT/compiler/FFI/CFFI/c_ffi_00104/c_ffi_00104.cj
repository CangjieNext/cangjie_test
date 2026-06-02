// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args

foreign func CallCangjieInC(fp: CFunc<(Int32, Int32)->Int32>, arg1: Int32, arg2: Int32): Int32

@C
func Add(x: Int32, y: Int32) : Int32
{
    return x + y
}

main():Int64 {
  let r1 = unsafe { CallCangjieInC(Add, 10, 20) }
  if (r1 != 30) {
      return 1
  }

  let r2 = unsafe { CallCangjieInC({x : Int32, y : Int32 => x * y}, 20, 30) }
  if (r2 != 600) {
      return 2
  }

  return 0
}
