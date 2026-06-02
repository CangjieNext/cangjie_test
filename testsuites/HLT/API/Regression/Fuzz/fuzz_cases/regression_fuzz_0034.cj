/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args 

import std.posix.*

foreign func printf(fmt: CString, ...): Int32

main() {
    var newpath: String = "/"
    var result: Int32 = chdir(newpath)

    var _path: String = getcwd()

    if ((result == 0) && (_path == newpath)) {
        print("pass")
    }

    return 0
}
