// DEPENDENCE: cmain.cj a/ b/
// EXEC: %mkdir h1 h2 h2/h3 h1/who
// EXEC: %compiler -p a --output-dir h1/who --output-type=staticlib -o libwhoA.%lib_extension %incrementalCompile
// EXEC: %compiler -p b --output-dir h2/h3 --output-type=staticlib -o libA.%lib_extension
// EXEC: %compiler --import-path h1 --import-path h2/h3 -L h1/who -lwhoA -L h2/h3 -lA cmain.cj -o main %incrementalCompile
// EXEC: %move a/main.2 a/main.cj
// EXEC: %compiler -p a --output-dir h1/who --output-type=staticlib %noColor -o libwhoA.%lib_extension %incrementalCompile 2>&1 | compare a/main.cj
// EXEC: %compiler --import-path h1 --import-path h2/h3 -L h1/who -lwhoA -L h2/h3 -lA cmain.cj -o main %incrementalCompile 2>&1 | compare %f
// ASSERT: scan-not the changed decl after Spreading is:main in file cmain.cj in line 4 in column 1


// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
