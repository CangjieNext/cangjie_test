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
class public {
    var public = 1
    var protected = (public, public + 1, public + 2)
}

main() {
    var protected = public()
    return protected.protected[0] + protected.protected[1] + protected.protected[2] - protected.public * 6
}
