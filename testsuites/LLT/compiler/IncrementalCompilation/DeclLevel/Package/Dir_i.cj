// DEPENDENCE: Dir/
// EXEC: %mkdir build build/a build/b build/c
// EXEC: %compiler -p Dir/a --output-dir build/a %incrementalCompile -Woff unused --output-type=staticlib -o liba.%lib_extension
// EXEC: %compiler --import-path build/a -p Dir/b --output-dir build/b %incrementalCompile -Woff unused --output-type=staticlib -o libb.%lib_extension
// EXEC: %compiler --import-path build/a --import-path build/b -p Dir/c --output-dir build/c %incrementalCompile -Woff unused --output-type=staticlib -o libc.%lib_extension
// EXEC: %rmfile Dir/a/main.cj
// EXEC: %move Dir/a/main.new Dir/a/main.cj
// EXEC: %compiler -p Dir/a --output-dir build/a %incrementalCompile -Woff unused --output-type=staticlib -o liba.%lib_extension 2>&1 | compare Dir/a/main.cj
// EXEC: %compiler --import-path build/a -p Dir/b --output-dir build/b %incrementalCompile -Woff unused --output-type=staticlib -o libb.%lib_extension 2>&1 | compare Dir/b/main.cj
// EXEC: %compiler --import-path build/a --import-path build/b -p Dir/c --output-dir build/c %incrementalCompile -Woff unused --output-type=staticlib -o libc.%lib_extension 2>&1 | compare Dir/b/main.cj


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
