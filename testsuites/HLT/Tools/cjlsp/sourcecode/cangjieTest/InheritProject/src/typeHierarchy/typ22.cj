/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.typeHierarchy

interface AB1{}
interface AB2<T>{}

interface AB4 <: AB1 & AB2<Bool> {}
class AB3<T> <: AB4 & AB2<T> {}

