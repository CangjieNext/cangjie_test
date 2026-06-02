/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// EXEC: %compiler %cmp_opt %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

class C1 {
    let v1 = 0
}

func foo<T>(a: T) {
    C1().v1
}

func goo<T>(a: (T) -> Int64, b: T) {
    a(b)
}

main() {
    goo<Bool>(foo<Bool>, true)
}
