/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %import-cangjie-stdx %cmp_opt %link_openssl %f -o %output
// RUN-EXEC: %run_stdx %output %run_args

import stdx.net.http.*

main(): Int64 {
    var count = 0

    try {
        FileHandler("", handlerType: UpLoad)
    } catch (e: IllegalArgumentException) {
        count++
    }
    try {
        FileHandler("", handlerType: UpLoad, bufferSize: -1)
    } catch (e: IllegalArgumentException) {
        count++
    }
    try {
        FileHandler("", handlerType: UpLoad, bufferSize: 4 * 1024 / 2)
    } catch (e: IllegalArgumentException) {
        count++
    }
    try {
        FileHandler("", handlerType: UpLoad, bufferSize: 4 * 1024 * 2)
    } catch (e: IllegalArgumentException) {
        count++
    }
    try {
        FileHandler("", handlerType: UpLoad, bufferSize: 64 * 1024 / 2)
    } catch (e: IllegalArgumentException) {
        count++
    }
    try {
        FileHandler("", handlerType: UpLoad, bufferSize: 64 * 1024 * 2)
    } catch (e: IllegalArgumentException) {
        count++
    }
    if (count != 6) {
        return 7
    }
    return 0
}
