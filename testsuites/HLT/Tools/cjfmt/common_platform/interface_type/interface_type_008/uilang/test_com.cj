/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public common interface I1 {
   public common func f(a: Int64) {
        a
   }
   public common static func g(a: Int64) {
        a
   }
   public common func f1(a: Int64): Unit
   public common static func g1(a: Int64): Unit
}

public common interface I2 <: I1 {
    public common override func f(a: Int64) {
       a + 1
    }
    public common static redef func g(a: Int64) {
       a + 1
    }
    public common override func f1(a: Int64): Unit {}
    public common static redef func g1(a: Int64): Unit {}
}
