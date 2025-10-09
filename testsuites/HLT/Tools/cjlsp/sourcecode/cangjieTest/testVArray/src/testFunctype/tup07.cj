/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

func f7(a!: (p1: Int64, p2: Int64) = (1, 3)) {}

var m1 = f7(a: (1, 2))
