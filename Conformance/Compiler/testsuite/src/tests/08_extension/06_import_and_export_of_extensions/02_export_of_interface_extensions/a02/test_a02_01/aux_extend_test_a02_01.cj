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

package a.b.c

internal import a.b.MyClass

private interface I {
    func test1() {
      return 1
    }
}

public interface AuxExtendTestA0201 {}
protected interface I2 {}
protected interface I3 {}
extend Int64 <: AuxExtendTestA0201 & I2 & I3 {}

extend <T> MyClass<T> <: I where T <: AuxExtendTestA0201 & I2 & I3 {
}
