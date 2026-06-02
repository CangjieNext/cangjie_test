// LEVEL: 0
// DEPENDENCE: %n.txt
// EXEC: %rmdir .cached
// EXEC: %compiler %n.cj -Woff all --experimental --incremental-compile
// EXEC: %move %n.txt %n.cj
// EXEC: %compiler %n.cj -Woff all --experimental --incremental-compile
// (Linux)EXEC: cat .cached/*.log | compare %n.cj
// (Windows)EXEC: type .cached\*.log | compare %n.cj
var a = 0
var b = 1
var c = 1

class C {
    let d = c
}
main () { a }



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
