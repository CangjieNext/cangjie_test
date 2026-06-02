// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

//  DEPENDENCE: ../src/main.cj
//  EXEC: %compiler %f --fast-math --verbose 2>&1 | compare %f
//  ASSERT: regex llc(.exe)?['"].*-fp-contract=fast

let a = 1.949921
let b = 9.125334

main() {
    print(a * b + a)
    0
}
