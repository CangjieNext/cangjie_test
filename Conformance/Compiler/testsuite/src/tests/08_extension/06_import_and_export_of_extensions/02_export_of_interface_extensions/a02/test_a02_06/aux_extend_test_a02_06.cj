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

package d.e

public import a.b.AuxTestA0206

private interface I {
  func test1(){
    return 1
  }
}

public interface AuxExtendTestA0206 {}
protected interface I2 {}
internal interface I3 {}
extend Int64 <: AuxExtendTestA0206 & I2 & I3 {}

extend <T> AuxTestA0206<T> <: I where T <: AuxExtendTestA0206 & I2 & I3 {

}
