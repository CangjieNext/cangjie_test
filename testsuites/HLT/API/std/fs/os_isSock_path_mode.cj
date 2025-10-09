/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// DEPENDENCE: getPath_isSock.sh test_fj.txt
// (not MAC and not Windows) EXEC: chmod +x getPath_isSock.sh
// (not MAC and not Windows) EXEC: ls -l
// (not MAC and not Windows) EXEC: ./getPath_isSock.sh s && cat mypath.cj
// (not MAC and not Windows) EXEC: %compiler %cmp_opt mypath.cj -o %output %f
// (not MAC and not Windows) RUN-EXEC: %run %run_opt %output %run_args
import std.posix.*

main() {
    var resulttrue1 = isSock(mypath)
    if (resulttrue1 != true) {
        return 1
    }
    var resultfalse1 = isSock("test_fj.txt")
    var resultfalse2 = isSock("./test_notexists")
    if (resultfalse1 != false || resultfalse2 != false) {
        return 2
    }
    return 0
}
