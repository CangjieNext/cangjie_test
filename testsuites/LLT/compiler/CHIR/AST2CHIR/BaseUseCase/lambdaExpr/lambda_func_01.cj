// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC: %compiler %f -o %output
// EXEC-5: %run %run_opt %output

// lambda func
func foo() {
    let g = {lambdaParam: Int64 => 2}
    return g(1)
}

func bar() {
    return {lambdaParam: Int64 => 3}(1)
}

main() {
    return foo() + bar()
}
