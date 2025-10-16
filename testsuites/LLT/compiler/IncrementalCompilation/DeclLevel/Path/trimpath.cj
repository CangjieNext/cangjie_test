// EXEC: %mkdir p1
// EXEC: %cpfile %f p1 
// (Windows) EXEC: %compiler %incrementalCompile %CD%\p1\%f -o a.exe --trimpath=%CD%\p1
// (not Windows) EXEC: %compiler %incrementalCompile "$(realpath %f)" -o a --trimpath="$(pwd)"
// EXEC: %move default.cjo old.cjo
// (Windows) EXEC: %compiler %incrementalCompile %CD%\%f -o b.exe --trimpath=%CD%
// (not Windows) EXEC: %compiler %incrementalCompile "$(realpath p1/%f)" -o b --trimpath="$(realpath p1)"
// EXEC: %diff default.cjo old.cjo
// EXEC: %move default.cjo old2.cjo
// (Windows) EXEC: %compiler %incrementalCompile .\p1\%f -o c.exe --trimpath=.\p1
// (not Windows) EXEC: %compiler %incrementalCompile ./p1/%f -o c --trimpath=./p1
// EXEC: %diff old2.cjo default.cjo

// change in .cjo when source path after trimming differs
// EXEC: %move default.cjo old3.cjo
// (Windows) EXEC: %compiler %incrementalCompile .\p1\%f -o c.exe --trimpath=.
// (not Windows) EXEC: %compiler %incrementalCompile ./p1/%f -o c --trimpath=.
// EXEC-1: %diff old3.cjo default.cjo

public func foo() {}
main() {}


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
