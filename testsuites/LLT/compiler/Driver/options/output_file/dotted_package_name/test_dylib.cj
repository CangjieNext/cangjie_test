// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: pkg
//  EXEC: %compiler -p pkg --output-type=dylib
//  EXEC: %compiler %f -L. -lservice.auth -o %output
//  EXEC-42: %run %run_opt %output %output

internal import service.auth.*

main() {
    return get()
}
