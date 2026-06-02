/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:     Defines a package a.c for example.

  @Structure:       complex-aux
*/

package a.c

public import a.b.AuxTestA0209

protected interface I {
  func test1(){
    return 1
  }
}

public interface I1 {}
public interface I2 {}
protected interface I3 {}
extend Int64 <: I1 & I2 & I3 {}

extend <T> AuxTestA0209<T> <: I where T <: I1 & I2 & I3 {
}
