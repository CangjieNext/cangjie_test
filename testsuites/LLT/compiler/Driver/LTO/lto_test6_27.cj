// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args

internal import stdx.encoding.base64.*

main(): Int64 {
    var arr: Array<UInt8> = [77, 97, 110]
    var str = toBase64String(arr)
    var opArr: Option<Array<UInt8>> = fromBase64String(str)
    var arr2: Array<UInt8> = match (opArr) {
        case Some(s) => s
        case None => Array<UInt8>()
    }
    if (arr2 == arr) {
        return 0
    }
    return 1
}
