// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// (Darwin) EXEC: %clang %clang_shared_opt -Wl,-undefined,suppress,-flat_namespace %n.c -o %cffi_output
// (not Darwin) EXEC: %clang %clang_shared_opt %n.c -o %cffi_output
// EXEC: %compiler %cmp_opt_chir2hlir %f %cffi-link -o %output
// EXEC: %pwd_to_ld_path %run %run_opt %output %run_args
// ASSERT: scan 3

foreign func PassToCVoid(a:Int32): Unit

func PassVoidAndReturnInt32():Int64
{
  unsafe { PassToCVoid(3) }
  return 0
}

main():Int64 {
  return PassVoidAndReturnInt32()
}
