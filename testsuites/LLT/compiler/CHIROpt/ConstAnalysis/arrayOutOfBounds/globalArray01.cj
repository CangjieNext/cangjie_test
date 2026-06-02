// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// ERRCHECK: %frontendCompiler %cmp_opt %f -o %n.%suffix -Woff unused %diag_json

let g: Array<Option<Bool>> = []

func foo() {
    var a = g[4]
}

main() {}
// ASSERT: scan chir_idx_out_of_bounds
