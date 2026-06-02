template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name: 02_01_10_02_a30_%02d

  @Assertion: In addition to the primary constructor, it is possible to define user-defined constructors,
              which are defined by starting with the keyword init and followed
              by the parameter list and the function body.

  @Description: Check that a constructor can not be defined with the '%s' keyword

  @Mode: compileonly

  @Negative: yes

  @Structure: single
*/

struct A {
    %s(a: Int64) {
        this.x = a
    }

    let x: Int64
}

main() {
}
'''

keywords = ["as", "break", "Bool", "case", "catch", "class", "continue", "Rune", "do", "else", "enum", "extend",
            "false", "finally", "for", "foreign", "from", "func", "Float16", "Float32", "Float64", "if", "import", "in",
            "interface", "is", "Int8", "Int16", "Int32", "Int64", "IntNative", "let", "macro", "match", "mut",
            "main", "Nothing", "operator", "package", "prop", "quote", "return", "spawn", "struct", "static", "super", "synchronized",
            "this", "throw", "true", "try", "type", "This", "unsafe", "UInt8", "UInt16", "UInt32", "UInt64", "UIntNative",
            "Unit", "var", "where", "while", "inout", "abstract",  "open", "override", "private", "protected", "public",
            "redef", "get", "set", "sealed"]

def iterate():
  testcase = 7
  for s in keywords:
    with open(f'./test_a30_{testcase:02d}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (testcase, s, s))
      testcase+= 1

iterate()