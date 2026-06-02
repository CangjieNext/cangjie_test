// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/package00
// EXEC-PIPE-1: %compiler -p package00 --output-type=staticlib -o package00/test.cj 2>&1 | compare %f
// (not Windows) ASSERT: scan [31merror[0m: The input file 'package00/test.cj' would be overwritten by the generated output.
// (Windows) ASSERT: scan [31merror[0m: The input file 'package00\\test.cj' would be overwritten by the generated output.
