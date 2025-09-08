// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

public func foo(){0}

public interface fatherInterface<T>{
  static func foo1(): T
  static func foo2<T>(a!: T): T where T <: ToString{a}
}

public interface MyInterface<T> <: fatherInterface<T>{
  static func foo3(): T{foo1()}
}

extend Float32 <: MyInterface<Float64>{
  static func f() {foo2<Float64>(a:5.0)}
  public static func foo1(){f()}
}

main() {
  if (Float32.foo2<Float64>(a:5.0) == 5.0 && Float32.foo3() == 5.0){
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
