/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:     Defines a package a.b.c for example.

  @Structure:       complex-aux
*/

package b

public import a.MyClass

public interface AuxExtendTestA0401 {
    func test1():Unit
}

extend AuxTestA0401 {
    public func test1() {
      return 1
    }
}

extend AuxTestA0401 <: I1 {}
