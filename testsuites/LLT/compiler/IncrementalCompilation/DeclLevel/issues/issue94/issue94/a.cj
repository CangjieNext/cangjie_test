// DEPENDENCE: %n.old.cj %n.new.cj
// EXEC: %cpfile %n.old.cj inc.cj
// EXEC: %compiler %incrementalCompile inc.cj -o %n.%lib_extension --output-type=staticlib
// (not Windows) EXEC: nm %n.%lib_extension | grep 3RRR | awk '{print $2,$3}' > a.t
// EXEC: %cpfile %n.new.cj inc.cj
// EXEC: %compiler %incrementalCompile inc.cj -o %n.%lib_extension --output-type=staticlib
// (not Windows) EXEC: nm %n.%lib_extension | grep 3RRR | awk '{print $2,$3}' > b.t
// (not Windows) EXEC: diff a.t b.t

nm not available on windows. dumpbin is not available unless MSVC is installed and correctly configured outside a VS prompt. So no test commands on Windows.


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
