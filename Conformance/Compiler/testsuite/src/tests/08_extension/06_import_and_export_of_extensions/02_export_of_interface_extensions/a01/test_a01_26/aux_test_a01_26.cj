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

private interface I {
  func test1(){
    return 1
  }
}

protected class MyClass<T> {}

extend<T> MyClass<T> <: I {
    public func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}