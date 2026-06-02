// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// (CJNATIVE and Windows) EXEC: echo echo injected > test.bat
// (CJNATIVE and Windows) EXEC: mkdir "test.bat;dir;"
// (CJNATIVE and Windows) EXEC: xcopy /e /q %CANGJIE_HOME% "test.bat;dir;"
// (CJNATIVE and Windows) EXEC-PIPE-0: "test.bat;dir;\bin\cjc.exe" %f %verbose_opt 2>&1 | compare %f
// (CJNATIVE and Windows) ASSERT: scan-not injected

main() {
    return 0
}
