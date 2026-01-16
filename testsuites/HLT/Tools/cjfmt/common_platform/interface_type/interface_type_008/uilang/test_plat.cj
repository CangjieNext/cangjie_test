/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public platform interface I1 {
   public platform func f(a: Int64) {
        a
   }
   public platform static func g(a: Int64) {
        a
   }
   public platform func f1(a: Int64): Unit
   public platform static func g1(a: Int64): Unit
}

public platform interface I2 <: I1 {
    public platform override func f(a: Int64) {
       a + 1
    }
    public platform static redef func g(a: Int64) {
       a + 1
    }
    public platform override func f1(a: Int64): Unit {}
    public platform static redef func g1(a: Int64): Unit {}
}
