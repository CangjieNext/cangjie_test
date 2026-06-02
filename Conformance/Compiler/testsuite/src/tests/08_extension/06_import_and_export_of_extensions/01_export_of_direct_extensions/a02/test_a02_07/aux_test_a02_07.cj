/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Description:     Defines a package a.b for example.

  @Structure:       complex-aux
*/

package a.b

public interface AuxTestA0207 {}
protected interface I2 {}
internal interface I3 {}
extend Int64 <: AuxTestA0207 & I2 & I3{}

internal class MyClass<T> {}

extend<T> MyClass<T> where T <: AuxTestA0207 & I2 & I3 {
    public func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}