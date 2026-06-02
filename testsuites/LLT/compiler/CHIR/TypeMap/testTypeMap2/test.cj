// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// LEVEL: 0
// DEPENDENCE: pkg/
// EXEC: %compiler --output-type=staticlib pkg/pkg1.cj -o pkg1.%middle
// EXEC: %compiler --output-type=staticlib pkg/pkg.cj -o pkg.%middle
// EXEC: %compiler pkg1.%middle pkg.%middle %f -o %output
// RUN-EXEC: %run %run_opt %output %run_args

internal import A.*
internal import B.*

main() {
    BB().test<Int64>()
    0
}
