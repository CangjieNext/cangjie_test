// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testa.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt testa.cj -o testa.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testa.%middle %n.cj -o %output

import testa.*

// Regression case for https://gitcode.com/Cangjie/cangjie_compiler/issues/878.
// Both `interface DDD` and `DDDImpl` below are required to trigger the bug:
// the generic upper-bound check on `TaskOption` used to pollute the
// inherited-member cache with an empty entry before the imported class was
// really checked, and this package then wrongly reported that `getHandler`
// has no overridden function in its supertype. Do not remove either decl;
// the expected result is that this file compiles without any error.
public interface DDD {
    func sendCallBack<M, N>(taskOption: CallableTaskOption<M, N>): Unit
}

class DDDImpl<M, N, T> where T <: TaskOption<M, N> {
}
