// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: %compiler %f %cmp_opt >a.t 2>&1
// EXEC: %compiler %f %cmp_opt -g >b.t 2>&1
// (Linux) EXEC: cat b.t
// (Linux) EXEC: (( $(grep 'unused variable:' b.t | wc -l) == 2 ))
// (Linux) EXEC: (( $(grep 'unused variable:' a.t | wc -l) == 2 ))
func foo() {
    let p: Any = true 
    let q: CType = false
}
main() {}