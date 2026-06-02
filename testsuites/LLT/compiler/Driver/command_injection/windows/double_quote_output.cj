// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// For some reason any additional texts following the next compile command will be treated as
// arguments for %compiler. To be specific, 2>&1 will be treated as argument instead of redirection
// control. It causes 'invalid file or directory 2>&1' error instead of output redirection and it
// doesn't match our expectation. Echoing command into a batch file is a work around against this
// problem.
// The command we want to run: `%compiler %cmp_opt "%f" -o hel\"lo.exe`.
// (CJNATIVE and Windows) EXEC-0: echo %compiler %cmp_opt "%f" -o hel^\^"lo.exe > command.bat
// (CJNATIVE and Windows) EXEC-0: type command.bat
// (CJNATIVE and Windows) EXEC-PIPE-1: .\command.bat 2>&1 | compare "%f"
// (CJNATIVE and Windows) ASSERT: scan hel"lo.exe: Invalid argument

main() {
    println("Hello")
    return 0
}
