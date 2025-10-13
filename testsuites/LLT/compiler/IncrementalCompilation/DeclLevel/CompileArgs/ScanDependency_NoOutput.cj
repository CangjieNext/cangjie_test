// EXEC-PIPE-0: %compiler %incrementalCompile -p . --scan-dependency 2>&1 | compare %f
// ASSERT: scan-not load cached info failed, rollback
// (not Windows) EXEC: (( $(ls %cachePath | wc -l) == 0 ))
// (Windows) EXEC-1: dir /A /B %cachePath | findstr /R "."
main(): Int64 { 0 }

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
