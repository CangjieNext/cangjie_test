// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// EXEC-PIPE-0: %compiler %cmp_opt %f -o %output
// RUN-EXEC-PIPE-0: %run %run_opt %output %run_args 2>&1 | compare %f
// ASSERT: scan-not core dumped
// ASSERT: scan-not stack trace
// ASSERT: scan 35

var glb = 0

func foo1() {
    glb += 3
    print(glb)
    return 1
}

func foo2() {
    glb += 2
    print(glb)
    return 0
}

main() {
    let a: VArray<Int64, $2> = [1, 2]
    let arr = VArray<VArray<Int64, $2>, $5>(repeat: a)
    let c = arr[foo1()][foo2()]
    0
}
