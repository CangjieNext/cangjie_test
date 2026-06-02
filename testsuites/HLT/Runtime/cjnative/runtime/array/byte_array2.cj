/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// (Windows and not OHOS) EXEC-PIPE: (set cjHeapSize=6GB) && %run %run_opt %output %run_args
// (Linux or OHOS) RUN-EXEC-PIPE: export cjHeapSize=6GB && %run %run_opt %output %run_args
// ASSERT: scan [11, 11, 11, 11, 11]

main() {
    var arr = Array<Byte>(2147483690, repeat: 99)
    var arr1 = Array<Byte>(2147483690, repeat: 11)
    arr1.copyTo(arr, 2147483647, 2147483660, 5)
    if (arr[2147483660] == 99) {
        return 3
    }
    println(arr.slice(2147483660, 5).toArray())
    0
}
