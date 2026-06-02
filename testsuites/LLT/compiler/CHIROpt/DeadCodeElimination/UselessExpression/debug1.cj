// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-0: %compiler %enableO2 -Woff all %f -o %n.%suffix 
// RUN-EXEC-0: %run %run_opt %output %run_args

const func test1() {
    1
}

const func temp() {
    const a = test1
}

main() {
    return 0
}
