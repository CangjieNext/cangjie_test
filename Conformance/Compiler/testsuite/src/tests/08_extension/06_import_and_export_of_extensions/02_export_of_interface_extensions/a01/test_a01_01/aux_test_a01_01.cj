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

public interface AuxTestA0101 {
    func test1(){
        return 1
    }
}

protected class MyClass {}

extend MyClass <: AuxTestA0101{
    public func myExtendFunc() {
        "MyClass myExtendFunc()"
    }
}