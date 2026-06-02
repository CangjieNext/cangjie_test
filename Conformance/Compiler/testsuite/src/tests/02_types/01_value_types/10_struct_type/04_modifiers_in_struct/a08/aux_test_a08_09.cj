/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
  @Description:     Contains a struct with a static member property without an access modifier.

  @Structure:       complex-aux
  @CompileWarning:  no
*/

package p9

public struct AuxTestA0809{
    static prop let p: Int64 {
        get() { 1 }
    }
}
