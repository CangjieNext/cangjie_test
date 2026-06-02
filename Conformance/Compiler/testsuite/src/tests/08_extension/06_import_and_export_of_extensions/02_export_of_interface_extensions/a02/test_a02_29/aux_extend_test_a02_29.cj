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

package d

public import a.b.AuxTestA0229

public interface I {
  func test1(){
    return 1
  }
}

public interface I11 {}
protected interface I12 {}
protected interface I13 {}
extend Int64 <: I11 & I12 & I13 {}

extend <T> AuxTestA0229<T> <: I where T <: I11 & I12 & I13 {

}
