/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Name:         helper

  @Level:         1

  @Description:  Implementation of MyClass

  @Structure:    complex-aux
*/
class MyClass <: Equatable<MyClass> {
    private let intVal:Int32

    init(intVal:Int32) {
        this.intVal = intVal
    }

    public operator func !=(that: MyClass): Bool {
        return intVal != that.intVal
    }

    public operator func ==(that: MyClass): Bool {
        return intVal == that.intVal
    }
}
