/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.testFunctype

class B1 {
    B1(aa: (p1: B1, p2: Int16)) {}
}

func f13(a: (p1: B1, p2: Int64) -> Unit) {}
