// LEVEL: 0
// EXEC: %compiler %debugCHIROpt %cmp_opt %f -o %output
// ASSERT: regex-not core dumped
// ASSERT: regex-not stack trace

internal import std.convert.*
main() {
    var output: Any = 0
    output = Float64.tryParse("${(output as Int32).getOrThrow()}").getOrThrow()
}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
