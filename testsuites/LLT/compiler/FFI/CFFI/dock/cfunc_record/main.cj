// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: cfunc_struct.c
// (Linux) EXEC: %clang %clang_shared_opt cfunc_struct.c -o %cffi_output
// (Linux) EXEC: %compiler %cmp_opt_chir2hlir %cffi-link %verbose_opt %f -o %output

// (Windows) EXEC: %clang -c cfunc_struct.c && ar rcs libmain.a *.o
// (Windows) EXEC: %compiler %cmp_opt_chir2hlir -L . -lmain %verbose_opt %f -o %output

@C
public struct BiggerStruct {
   public var x: Int64
   public var y: Int64
   public var z: Int64
   public init (x_: Int64, y_: Int64, z_: Int64) {
      x = x_
      y = y_
      z = z_
   }
}

@C
public func C2CJ_Func(aStruct: BiggerStruct): BiggerStruct {
  print(aStruct.x.toString())
  var xxx : BiggerStruct = BiggerStruct(13, 14, 15)
  return xxx
}

foreign func C_Func(aStruct: BiggerStruct): BiggerStruct

main():Int64 {
  var aaa : BiggerStruct = BiggerStruct(3, 4, 5)
  var bbb : BiggerStruct = unsafe{ C_Func(aaa) }

  return 0
}
