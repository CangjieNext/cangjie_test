/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package CFunc

//键入CFunc<T>类型，悬浮提示可以显示其定义信息
var ptr = CPointer<Int8>()
var test_06 = CFunc<() -> UInt>(ptr)
