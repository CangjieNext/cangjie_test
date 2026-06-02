// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: a.cj b.cj
// EXEC: %compiler %cmp_opt --output-type=staticlib a.cj  -o a.%middle
// EXEC: %compiler %cmp_opt --output-type=staticlib b.cj -o b.%middle
// (not CJNATIVE) EXEC: %compiler %cmp_opt a.%middle b.%middle %f -o %output
// (CJNATIVE) EXEC: %compiler %cmp_opt b.%middle a.%middle %f -o %output
// EXEC-PIPE: %run %run_opt %output %run_args | compare %f
// ASSERT: scan-1 ggg

internal import A.*
internal import B.*

main() {
    var x = BB()
    x.test<Int64>()
    0
}
