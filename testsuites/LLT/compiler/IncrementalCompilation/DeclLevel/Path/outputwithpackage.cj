// EXEC: %mkdir some
// EXEC: %cpfile %f some
// EXEC: cjc -p some %incrementalCompile -j1 -o a.%suffix
// EXEC-PIPE: cjc -p some %incrementalCompile -j1 -o b.%suffix | compare %f
// (Windows): EXEC: powershell -c "exit ((ls).Length - 6)"
// (not Windows) EXEC: (( $(ls .cached | wc -l) == 6 ))
// ASSERT: scan no change

main() {}

// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
