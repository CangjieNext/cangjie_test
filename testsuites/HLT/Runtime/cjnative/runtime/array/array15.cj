/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 3
// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// (not OHOS and not iOS) RUN-EXEC-PIPE: %export cjHeapSize=10GB && %run %run_opt %output %run_args

main() {
    var dstArray: Array<Int16> = Array<Int16>(1172483648, repeat: 11)
    var srcArray: Array<Int16> = Array<Int16>(1127483648, repeat: 122)

    var arrClone = dstArray.clone()
    if (arrClone[483648] != 11) {
        return 1
    }

    srcArray.copyTo(dstArray, 3, 4, 483648)
    if (dstArray[483648] != 122) {
        return 2
    }

    return 0
}
