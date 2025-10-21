/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

interface I_1 {}
interface I_2<T> {}
interface I_3<U> {}
interface I_4<V> <: I_2<V> & I_3<Int32> {}
