/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package default.pkg

let op1 = Option<Int32>.Some(12)
let op2 = Option<Int32>.None

let m_1: Int32 = op1.getOrThrow()
let m_2: Int32 = op2.getOrThrow()

let m5: Int32 = op1 ?? 0
let m6: Int32 = op2 ?? 0
