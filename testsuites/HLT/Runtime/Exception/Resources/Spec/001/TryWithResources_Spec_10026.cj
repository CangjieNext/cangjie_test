/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 1
// ERRCHECK: %compiler %cmp_opt %f -o %output

interface A<T> {
    func isClosed() {
        print("A!");
        true
    }
    func close() {}
}

class B<T> <: A<T> {}

main() {
    try (x: A<Bool> = B<Bool>()) {
    } finally {}
    print("success!\n")
    return 0
}
// ASSERT: scan sema_mismatched_types
