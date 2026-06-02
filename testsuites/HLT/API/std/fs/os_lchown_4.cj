/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 0
// DEPENDENCE: test_fj.txt
// (not Windows) EXEC-PIPE: ln -s test_fj.txt mylink
// (not Windows) EXEC-PIPE: %compiler %cmp_opt -o %output %f
// (not Windows) RUN-EXEC-PIPE: %run %run_opt %output %run_args

import std.posix.*

main(): Int64 {
    var path = getcwd()
    var linkpath = path + "/mylink"
    var res1 = lchown(linkpath, UInt32(0), UInt32(0))
    if (res1 != Int32(0) && res1 != Int32(-1)) {
        return 1
    }
    return 0
}
