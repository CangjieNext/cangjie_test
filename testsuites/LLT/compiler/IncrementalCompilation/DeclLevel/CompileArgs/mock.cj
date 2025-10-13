// EXEC: %compiler %incrementalCompile %n.cj -o %output --mock=on
// EXEC: %compiler %incrementalCompile %n.cj -o %output --mock=on | compare %f
// ASSERT: scan enable mock, roll back to full compilation

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
