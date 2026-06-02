// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// DEPENDENCE: %n.c
// EXEC: %clang -c %n.c -o %n.o
// EXEC: %compiler %f %n.o -o %output
// EXEC: %run %run_opt %output %run_args

// 定义与BiggerStruct布局相同的struct类型
@C
struct BiggerStruct {
   public init(a: Int64, b: Int64, c: Int64) {
       x = a
       y = b
       z = c
   } // int64映射C侧long long

   public var x: Int64
   public var y: Int64
   public var z: Int64
}
// 声明native函数，函数参数返回值用struct类型直接映射C Struct类型
foreign func PassToCBigger(x:BiggerStruct): BiggerStruct

func PassAndReturnCStructByValueBigger():Int64
{
  var biggerPass = BiggerStruct(11,22,33) // 创建struct
  var biggerReturn = unsafe { PassToCBigger(biggerPass) } // 传入C侧
  var ret = biggerReturn.x + biggerReturn.y + biggerReturn.z
  if (ret == 132) {
    return 0
  }
  return 1
}

main():Int64 {
  return PassAndReturnCStructByValueBigger()
}
