/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC-PIPE: %compiler %cmp_opt  %f -o %output
// RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.time.*

main() {
    var time01 = DateTime.parse("2022-12-02T12:23:23Z")
    var duration01 = Duration.hour * 13
    var time02 = time01 - duration01
    var time02toString = time02.toString()
    if (time02toString != "2022-12-01T23:23:23Z") {
        return 1
    }
    return 0
}
