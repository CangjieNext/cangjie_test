/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Defines a package p1 for example.

  @Structure:       complex-aux
*/

package p1

public open class AuxTestA0501 {}

extend AuxTestA0501 {
    private prop v1: Int64 { // ok
        get() { 0 }
    }
    public prop v2: Int64 { // ok
        get() { 0 }
    }
    protected prop v3: Int64 { // ok
        get() { 0 }
    }
    prop v4: Int64 { // visible in the package
        get() { 0 }
    }
}
