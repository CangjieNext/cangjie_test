// Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: testa.cj
// EXEC: %compiler %cmp_opt %compile_lib_opt testa.cj -o testa.%middle
// EXEC: %compiler %cmp_opt %compile_lib_opt testa.%middle %n.cj -o %output

import testa.*

public interface DDD {
    func sendCallBack<M, N>(taskOption: CallableTaskOption<M, N>): Unit
}

class DDDImpl<M, N, T> where T <: TaskOption<M, N> {
}
