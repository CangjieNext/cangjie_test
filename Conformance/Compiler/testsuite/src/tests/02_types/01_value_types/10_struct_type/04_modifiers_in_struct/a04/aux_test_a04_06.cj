/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Contains a struct with a primary constructor with a non-static member variable parameter with the
                    "private" access modifier.

  @Structure:       complex-aux
  @CompileWarning:  no
*/

package p6

public struct AuxTestA0406 {
    public AuxTestA0406(private let a: Int64) {}
}
