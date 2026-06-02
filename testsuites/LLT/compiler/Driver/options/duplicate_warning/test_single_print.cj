// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// DEPENDENCE: ../src/main.cj
//  EXEC:%compiler main.cj --output-type=staticlib --output-type=dylib --output-type=exe -o %output | compare %f
//  ASSERT: regex-not warning.*is specified multiple times.*is specified multiple times
//  EXEC: %output
