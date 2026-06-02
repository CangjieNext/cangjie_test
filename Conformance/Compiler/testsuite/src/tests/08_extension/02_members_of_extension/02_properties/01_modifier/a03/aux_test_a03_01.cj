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

public open class AuxTestA0301 {}

extend AuxTestA0301 {
    protected prop p: Int64 { 
        get() { 1 }
    }
}
