// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (not Windows)EXEC: %compiler %cmp_opt --lto=full %enableO2 --no-sub-pkg %f -o %output
// (not Windows)RUN-EXEC: %run %run_opt %output %run_args

// Windows does not support LTO optimization.
interface cjTest74659906233531823 {
    static func foo() {}
}

struct cjTest74659645582878216 {
    static init() {}
}

main() {
}
