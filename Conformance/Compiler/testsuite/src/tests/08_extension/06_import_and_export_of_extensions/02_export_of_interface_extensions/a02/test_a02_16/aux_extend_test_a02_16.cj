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

package a.b.c

public import a.b.AuxTestA0216

protected interface I {
  func test1(){
    return 1
  }
}

public interface AuxExtendTestA0216 {}
protected interface I12 {}
private interface I13 {}
extend Int64 <: AuxExtendTestA0216 & I12 & I13 {}

extend <T> AuxTestA0216<T> <: I where T <: AuxExtendTestA0216 & I12 & I13 {

}
