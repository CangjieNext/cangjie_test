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

internal interface I {
    func test1() {
        return 1
    }
}

public interface AuxTestA0107 {}
protected interface I12 {}
internal interface I13 {}
extend Int64 <: AuxTestA0107 & I12 & I13 {}

protected class MyClass<T> {}

extend<T> MyClass<T> <: I where T <: AuxTestA0107 & I12 & I13 {
    public func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}