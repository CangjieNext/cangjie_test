// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %run %run_opt %output %run_args

internal import std.sort.*

main() {
    var arr: Array<Int64> = [123, 1514, 5345, 74, 32, 231, 141]
    arr.sort()
    if (arr == [32, 74, 123, 141, 231, 1514, 5345]) {
        return 0
    } else {
        return 1
    }
}
