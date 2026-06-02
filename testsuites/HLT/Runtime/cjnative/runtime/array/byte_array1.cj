/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt --int-overflow wrapping %f -o %output
// (Windows and not OHOS) EXEC-PIPE: (set cjHeapSize=4GB) && %run %run_opt %output %run_args
// (Linux or OHOS) RUN-EXEC-PIPE: export cjHeapSize=4GB && %run %run_opt %output %run_args
// ASSERT: regex call void @"_ZN8std\.core5ArrayIh6<init>Elh"\(i8 addrspace\(1\)\* null, %record._ZN8std\.core5ArrayIhE addrspace\(1\)\* %\d+, i64 2147483648, i8 99\)

main() {
    var arr = Array<Byte>(2147483648, repeat: 99)
    if (arr[2147483647] != 99) {
        return 3
    }
    0
}
