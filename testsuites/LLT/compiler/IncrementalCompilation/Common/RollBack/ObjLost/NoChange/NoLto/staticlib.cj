// LEVEL: 0
// EXEC: %rmdir .cached
// EXEC: %compiler %n.cj -Woff all %enableCompileDebug %incrementalCompile --output-type=staticlib
// (Linux) EXEC: %rmfile .cached/*.o
// (Windows) EXEC: powershell -c "rm .cached/*.o"
// EXEC: %compiler %n.cj -Woff all %enableCompileDebug %incrementalCompile --output-type=staticlib 2>&1 | compare %f

public func foo (){}

// ASSERT: scan rollback
// ASSERT: scan cached obj file not exist, roll back to full compilation

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
