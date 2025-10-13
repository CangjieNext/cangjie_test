// LEVEL: 0
// (Linux) EXEC: %rmdir .cached
// (Linux) EXEC: %compiler %n.cj -Woff all %enableCompileDebug %incrementalCompile --output-type=staticlib --lto=thin
// (Linux) ERRORCHECK: ls .cached/*.o
// (Linux) EXEC: %compiler %n.cj -Woff all %enableCompileDebug %incrementalCompile --output-type=staticlib --lto=thin 2>&1 | compare %f

public func foo (){}
main () {}
// ASSERT: scan no change
// ASSERT: scan-not roll back to full compilation


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
