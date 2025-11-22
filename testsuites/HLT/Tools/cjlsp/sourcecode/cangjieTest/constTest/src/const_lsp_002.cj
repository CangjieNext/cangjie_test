/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

package constTest

const expr2_1 = match (1) {
    case 2 => 3
    case 1 => 2
    case _ => 1
}
const expr2_2 = match (Some(100)) {
    case Some(100) => 3
    case None => 2
    case _ => 1
}
