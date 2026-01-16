/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package mp

public specific interface I1 {
   public specific func f(a: Int64) {
        a
   }
   public specific static func g(a: Int64) {
        a
   }
   public specific func f1(a: Int64): Unit
   public specific static func g1(a: Int64): Unit
}

public specific interface I2 <: I1 {
    public specific override func f(a: Int64) {
       a + 1
    }
    public specific static redef func g(a: Int64) {
       a + 1
    }
    public specific override func f1(a: Int64): Unit {}
    public specific static redef func g1(a: Int64): Unit {}
}
