// LEVEL: 0
// EXEC: %rmdir .cached
// EXEC: %compiler %n.cj -Woff all --experimental --incremental-compile
// EXEC: %compiler %n.cj -Woff all --experimental --incremental-compile
// (Linux)EXEC: cat .cached/*.log | compare %n.cj
// (Windows)EXEC: type .cached\*.log | compare %n.cj
main () {}
// ASSERT: scan no change

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
