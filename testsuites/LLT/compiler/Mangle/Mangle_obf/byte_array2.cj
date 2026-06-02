// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt --fobf-all --fno-obf-export-symbols --int-overflow wrapping %f -o %output

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
