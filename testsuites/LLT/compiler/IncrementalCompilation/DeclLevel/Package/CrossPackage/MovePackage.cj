// EXEC: %mkdir p1
// EXEC: %cpfile %f p1
// EXEC: %compiler %incrementalCompile -p p1
// EXEC: %cpdir p1 p2
// EXEC-PIPE: %compiler %incrementalCompile -p p2 | compare %f
// EXEC-PIPE: %compiler %incrementalCompile -p p1 | compare %f
// ASSERT: scan no raw modified decls
// ASSERT: scan incremental compile result kind: no change

main() {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
