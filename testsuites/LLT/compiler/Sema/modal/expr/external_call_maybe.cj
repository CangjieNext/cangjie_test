// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// External local! arguments are forbidden for local? parameters as well.
// ERRCHECK: %compiler %local %cmp_opt %compile_lib_opt %f -o %output -Woff all
// ASSERT: scan-2 cannot pass an external @local! argument outside exclave

func size(s: String @local?): Int64 { s.size }

func direct(s: String @local!): Int64 {
    size(s)
}

func indirect(s: String @local!): Int64 {
    let reader = size
    reader(s)
}
