/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg1 for test.

  @Structure:       complex-aux
*/

package pkg1


public class MyClass {}

public struct MyStruct {}

public enum MyEnum { J }


extend MyClass {
    public func myFunc() { 1 }
}

extend MyStruct {
    public func myFunc() { 1 }
}

extend MyEnum {
    public func myFunc() { 1 }
}
