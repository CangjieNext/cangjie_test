/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
 
// ASSERT: scan-full Compatible!\n
package test_stable_abi

// test class: super class
open public class Father1 {}

open public class Father2 {}

public class Son1 <: Father1 {
    public func f1() {
        100
    }
}  

public class Son2 {
    public func f2() {
        1001
    }
}  


