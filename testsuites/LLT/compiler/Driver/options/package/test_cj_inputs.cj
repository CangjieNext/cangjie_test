// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/package00
// EXEC:%compiler -p package00 %f -o %output 2>&1 | compare %f
// ASSERT: scan when having --package flag, not support compiling packages with source file
