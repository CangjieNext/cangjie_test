/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

open interface I3{}
open interface I4 <: I3{}
open interface I5 <: I4 {}
open interface I6 <: I5{}
interface I7 <: I6{}
interface I8 <: I7{}
interface I9 <: I8{}
interface I10 <: I9{}
interface I11 <: I10{}
interface I12 <: I10{}
interface I13 <: I10{}
