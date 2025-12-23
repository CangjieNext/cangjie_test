/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
package a

import a.sub.foo

// 未定义foo，直接使用import而来的foo
func wrapperB(p: Int64): Unit {
    foo(p)
}
