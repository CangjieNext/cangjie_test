// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
// EXEC-PIPE-0: %frontendCompiler %cmp_opt_chir2hlir %verbose_opt %f -o %output

func getCFunc(): CFunc<(Int64, Int64) -> Int64> {
    getCFunc()
}

main() {
    getCFunc()
    ()
}
