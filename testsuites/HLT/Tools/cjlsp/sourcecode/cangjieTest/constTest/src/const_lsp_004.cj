/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package constTest

// 当前编译器实现暂不支持 throw 作为 const 表达式使用
const expr4 = throw Exception("invalid frame")
