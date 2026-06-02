// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC-PIPE-0: %compiler %compile_exe_opt %n.cj %cmp_opt -o %output 2>&1 | compare %f
// (not CJNATIVE) ASSERT: scan error: an exception was thrown while evaluating constant
// (not CJNATIVE) ASSERT: scan IllegalArgumentException
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

const func myRange(m: Int64) : Range<Int64> {
    Range(0, 10, m, false, false, false)
}

public const meaningful_value = myRange(0)

main() {42}
