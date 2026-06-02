/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

const expr1 = if (true) {
    1 + 100
}
const expr2 = if (true) {
    1 ** 3
} else {
    1 - 10
}
const expr3 = match (1) {
    case 2 => 3
    case 1 => 2
    case _ => 1
}
const expr4 = match (Some(100)) {
    case Some(100) => 3
    case None => 2
    case _ => 1
}
const expr5 = try {
    2 ** 10
} catch (_) {
    10
}
const expr6 = 0 is String
const expr7 = 0.0 as Float64

// const expr8 = throw Exception("")

main() {
    const _expr1 = if (true) {
        1 + 100
    }
    const _expr2 = if (true) {
        1 ** 3
    } else {
        1 - 10
    }
    const _expr3 = match (1) {
        case 2 => 3
        case 1 => 2
        case _ => 1
    }
    const _expr4 = match (Some(100)) {
        case Some(100) => 3
        case None => 2
        case _ => 1
    }
    const _expr5 = try {
        2 ** 10
    } catch (_) {
        10
    }

    const _expr6 = 0 is String
    const _expr7 = 0.0 as Float64

    // const _expr8 = throw Exception("")
    0
}
