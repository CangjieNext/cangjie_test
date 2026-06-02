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
    while (let 1 <- 1) {
        a--;
        break
    }
    while (let '0' <- UInt8(UInt32(r'0'))) {
        a--;
        break
    }
    while (let 1.0 <- 1.0) {
        a--;
        break
    }
    while (let r'a' <- r'a') {
        a--;
        break
    }
    while (let true <- true) {
        a--;
        break
    }
    while (let "test" <- "test") {
        a--;
        break
    }
    while (let () <- ()) {
        a--;
        break
    }
    return a
}
