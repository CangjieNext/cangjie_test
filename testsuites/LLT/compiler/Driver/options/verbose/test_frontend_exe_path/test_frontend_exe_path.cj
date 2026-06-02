// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.

// After writing the above text path.txt may look like: // ASSERT: regex ['"]/wherever/CANGJIE_HOME/is/pointing/to/bin/cjc-frontend(.exe)?['"] 
// The space at the end of command is added by intention.
// (not Windows) EXEC: echo '// ASSERT: regex ['\''"]'$CANGJIE_HOME'/bin/cjc-frontend(.exe)?['\''"] ' > path.txt
// (Windows) EXEC: cmd /V /C "set "V=%CANGJIE_HOME:\=\\%" && echo // ASSERT: regex ['"]!V!\\?bin\\cjc-frontend(.exe)?['"]" >path.txt
// EXEC: %cat path.txt
// EXEC-PIPE-0: %compiler %cmp_opt --verbose %f 2>&1 | compare path.txt
// ASSERT: regex bin/cjc-frontend(.exe)?['"].*?test_frontend_exe_path\.cj

main() {
    return 0
}
