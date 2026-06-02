// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (Linux and CJNATIVE) EXEC: %compiler %import-cangjie-stdx %cmp_opt %f -o %output --lto=full
// (Linux and CJNATIVE) RUN-EXEC: %set_stdx_path %run %run_opt %output %run_args

internal import stdx.encoding.url.*

main() {
    var i = "http://other.example.com/%2F/%2F/?query=123"
    let s = URL.parse(i)
    if (s.hostName == "other.example.com") {
        return 0
    }
    return 1
}
