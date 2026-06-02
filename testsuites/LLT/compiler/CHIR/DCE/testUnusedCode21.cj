// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler %cmp_opt %f -o %output 2>&1 | compare %f
// (CJNATIVE) RUN-EXEC-0: %run %run_opt %output %run_args
// (CJNATIVE) ASSERT: scan-not warning
main() {
    VArray<Int64, $5>({
            i =>
            println(i);
            i
        })
    0
}
