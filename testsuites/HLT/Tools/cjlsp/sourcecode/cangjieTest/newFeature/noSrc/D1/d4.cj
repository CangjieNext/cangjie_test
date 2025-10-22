/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

open class  A2a<T1> {}
open class  B2 <: A2a<Int32> {}
open class  C2 <: A2a<Int32> {}
open class  D2 <: A2a<Int32> {}
open class  E2 <: A2a<Int32> {}
open class  F2<T> <: A2a<Int32> {}

class Data <: F2<E2> {}

var cc1 = Data()
