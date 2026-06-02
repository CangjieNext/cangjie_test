// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC-PIPE-0: %compiler -g %cmp_opt %f -o %output 
// (CJNATIVE) RUN-EXEC-0: %run %run_opt %output %run_args 2>&1 | compare %f
// (CJNATIVE) ASSERT: regex-not core dumped
// (CJNATIVE) ASSERT: regex-not stack trace

main() {
    var arr8: VArray<VArray<Int64, $2>, $2> = [[1, 2], [3, 4]]
    let arr9: VArray<Int64, $2> = [0, 1]
    arr8[1] = arr9
    if (arr8[1][0] == 0 && arr8[1][1] == 1) {
        return 0
    }
    1
}
