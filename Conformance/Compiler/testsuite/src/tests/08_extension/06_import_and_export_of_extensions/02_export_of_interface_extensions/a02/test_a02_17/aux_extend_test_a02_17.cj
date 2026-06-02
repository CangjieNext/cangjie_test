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

protected import a.b.MyClass

public interface AuxExtendTestA0217 {
  func test1(){
    return 1
  }
}


extend <T> MyClass<T> <: AuxExtendTestA0217 {

}
