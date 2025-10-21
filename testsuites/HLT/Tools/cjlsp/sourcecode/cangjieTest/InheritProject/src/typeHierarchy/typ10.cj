/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

interface II10<T> {}
interface II11 <: II10<Int64>{}
interface II12<T,R> <: II11 & II10<Bool>{}
