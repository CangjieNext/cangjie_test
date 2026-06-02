// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE) EXEC: %compiler %cmp_opt %enableO2 %coverage_opt %n.cj -o %n.%suffix
// (CJNATIVE) ASSERT: scan-not warning: '--coverage' should be used without optimizations.

main() {
    var a = 5000
    return 0
}
