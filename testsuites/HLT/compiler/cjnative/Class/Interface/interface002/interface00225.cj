/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %compile_lib_opt %f
interface I0 {}

interface I1 <: I0 {}

interface I2 <: I1 {}

interface I3 <: I2 {}

interface I4 <: I3 {}

interface I5 <: I4 {}
