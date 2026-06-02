/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

open class BB1 {}
interface BB2 {}
interface BB3 {}
interface BB4<T> {}
interface BB5 {}

extend BB1 <: BB2 & BB3 {}
extend BB1 <: BB4<Bool> {}
extend BB1<: BB5 {}
