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
struct public {
    var open = 1
    var abstract = 1
    var redef = 1
    var protected = (open, abstract + 1, redef + 2)
}

main() {
    var private = public()
    return private.protected[0] + private.protected[1] + private.protected[2] - private.open * 6
}
