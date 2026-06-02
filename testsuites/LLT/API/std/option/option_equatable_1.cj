/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt -o %n.%suffix %f
// EXEC: %run %run_opt %n.%suffix

main(): Int64 {
    if (Some(1) == Some(1)
        && Option<Int64>.None == Option<Int64>.None
        && !(Some(1) == Some(2))
        && !(Option<Int64>.None == Some(2))
        && !(Some(2) == Option<Int64>.None)) {
        return 0
    }

    return -1
}
