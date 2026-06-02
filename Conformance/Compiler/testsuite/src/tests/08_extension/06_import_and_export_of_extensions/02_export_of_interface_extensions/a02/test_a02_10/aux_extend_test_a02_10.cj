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

public import a.b.AuxTestA0210

internal interface I {
  func test1(){
    return 1
  }
}

extend AuxTestA0210 <: I {

}
