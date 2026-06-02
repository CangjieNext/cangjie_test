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
    let arrViaUInt16F: Array<UInt16> = [16, 12, 96]
    let arrViaUInt16S: Array<UInt16> = [23, 12, 92]
    if (!(arrViaUInt16F != arrViaUInt16S)) {
        return 1
    }
    return 0
}
