// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// EXEC: mkdir p1.bc
// ERRCHECK: %compiler %f p1.bc -o %output
// ASSERT: regex error.*: Not a file: 'p1.bc'
