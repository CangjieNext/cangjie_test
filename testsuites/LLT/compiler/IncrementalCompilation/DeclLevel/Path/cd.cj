// EXEC: %mkdir p1
// EXEC: %cpfile %f p1 
// (Windows): %compiler %incrementalCompile %%CD%%\p1\%f -o a.exe
// (Windows): %compiler %incrementalCompile %f -o b.exe
// (Windows): %diff a.exe b.exe
// (not Windows): %compiler %incrementalCompile "$(realpath %f)" -o a
// (not Windows): %compiler %incrementalCompile "$(realpath p1/%f)" -o b
// (not Windows): %diff a b 

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
