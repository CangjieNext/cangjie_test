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

public import a.b.AuxTestA0222

internal interface I1 {
  func test1(){
    return 1
  }
}
public interface AuxExtendTestA0222 {
  func test2(){
    return 2
  }
}
protected interface I3 {
  func test3(){
    return 3
  }
}
private interface I4 {
  func test4(){
    return 4
  }
}
internal interface I5 {
  func test5(){
    return 5
  }
}


extend <T> AuxTestA0222<T> <: I1 & I2 & I3 & I4 & I5 {

}
