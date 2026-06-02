// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %overflowOpt %cmp_opt %f -o %output

struct SSSS {
    public var aaaa: Option<Option<EEEE>> = Option<Option<EEEE>>.None
}

class CCCC {
    var x: SSSS = SSSS()
}

enum EEEE {
    A | B(SSSS, Int64, CCCC)
}

main(): Int64 {
    return 0
}
