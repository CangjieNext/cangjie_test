/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package pkg1 for example.

  @Structure:       complex-aux
*/

package pkg1

public class AuxTestA0101 {
    public var myVar: Int64 = 0

    public AuxTestA0101(a: Int64) {
        this.myVar = a
    }
}

extend AuxTestA0101 { 
    public func myFunc(a: Int64): Unit {
        this.myVar = a
    }

    public func myFunc(): Int64 {
        this.myVar
    }
}
