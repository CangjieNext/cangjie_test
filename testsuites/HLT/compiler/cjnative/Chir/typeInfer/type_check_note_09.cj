/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL: 2
// (not O2) ERRCHECK: %compiler %cmp_opt %f -o %output
// (not O2) ASSERT: scan no information known for type variable 'Generics-T'

func test() {
    func f<T>() {
    }
    f()
}

main() {
}
