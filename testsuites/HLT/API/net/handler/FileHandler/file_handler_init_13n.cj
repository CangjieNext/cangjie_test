/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// DEPENDENCE: ./data
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import std.fs.*
import stdx.net.http.*

main(): Int64 {
    var ss = canonicalize(Path("./data/../")).toString()
    var count = 0
    try {
        FileHandler(ss + "/testinvalid", handlerType: UpLoad)
    } catch (e: HttpException) {
        count++
        if (e.message != "No such file or directory.") {
            return 1
        }
    }
    try {
        FileHandler(ss + "/testinvalid", handlerType: UpLoad, bufferSize: 4 * 1024 / 2)
    } catch (e: HttpException) {
        count++
        if (e.message != "No such file or directory.") {
            return 2
        }
    }
    try {
        FileHandler(ss + "/testinvalid", handlerType: UpLoad, bufferSize: 4 * 1024 * 2)
    } catch (e: HttpException) {
        count++
        if (e.message != "No such file or directory.") {
            return 3
        }
    }
    try {
        FileHandler(ss + "/testinvalid", handlerType: UpLoad, bufferSize: 64 * 1024 / 2)
    } catch (e: HttpException) {
        count++
        if (e.message != "No such file or directory.") {
            return 4
        }
    }
    try {
        FileHandler(ss + "/testinvalid", handlerType: UpLoad, bufferSize: 64 * 1024 * 2)
    } catch (e: HttpException) {
        count++
        if (e.message != "No such file or directory.") {
            return 5
        }
    }
    if (count != 5) {
        return 6
    }

    return 0
}
