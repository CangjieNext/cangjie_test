/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// random seed:1648733848873

// All global variable need to be defined before use!
package test.c1

public interface Interface48<T0, T1> {}

public interface Interface47 <: Interface48<Int32, UInt32> {}

public interface Interface46<T0, T1> <: Interface47 & Interface48<Int32, UInt32> {}
