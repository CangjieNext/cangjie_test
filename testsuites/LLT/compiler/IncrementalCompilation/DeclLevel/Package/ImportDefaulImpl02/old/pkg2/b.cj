package pkg2

internal import pkg1.*

public func call<T>():Int64{
  var u1: MyInterface = UInt32(1)
  var u2: UInt32 = 1
  if (u1.foo2(a:1) == 2 && u2.foo2(a:2) == 4){
    return 0
  }else{
    return 1
  }
}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
