/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

main() {
    var a = 7
    if (let 1 <- 1) {
        a--
    } else {
        a++
    }
    if (let '0' <- UInt8(UInt32(r'0'))) {
        a--
    } else {
        a++
    }
    if (let 1.0 <- 1.0) {
        a--
    } else {
        a++
    }
    if (let r'a' <- r'a') {
        a--
    } else {
        a++
    }
    if (let true <- true) {
        a--
    } else {
        a++
    }
    if (let "test" <- "test") {
        a--
    } else {
        a++
    }
    if (let () <- ()) {
        a--
    } else {
        a++
    }
    return a
}
