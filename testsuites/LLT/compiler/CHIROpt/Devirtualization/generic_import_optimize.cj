// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (DEBUG_OPTION)EXEC-PIPE-0: %compiler %debugCHIROpt %enableDevirtualization -Woff all %f -o %n.%suffix 2>&1 | compare %f
// (DEBUG_OPTION)EXEC-PIPE-0: %run %run_opt %output %run_args
// ASSERT: regex-not \[Devirtualization\] The function call to next at \[16,.*\] was optimized.
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace

func access_iterator_desugar(arr: Array<Int64>): Unit {
    let it = arr.iterator()
    var sum = 0
    while (let Some(v) <- it.next()) {
        sum += v
    }
}

main() {
    access_iterator_desugar([0, 1, 2, 3, 4])
}
