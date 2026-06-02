/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
/*
   @Structure:       complex-aux
   @Issue:           0006227
 */

// pkg1 
package pkg1 
public interface Num<T> { 
    func add(other: T): T 
} 
extend Int32 <: Num<Int32> { 
    public func add(other: Int32) { 
        this + other 
    } 
} 

public var a : Int32 = 1 
public class C {} 