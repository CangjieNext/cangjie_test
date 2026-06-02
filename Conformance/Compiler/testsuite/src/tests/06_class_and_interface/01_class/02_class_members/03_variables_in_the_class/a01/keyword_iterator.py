template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name: 06_01_02_03_a01_%02d

   @Assertion: A variable that is declared in a class or interface is called a member variable.
              Member variables can be declared as immutable by the keyword let, or mutable by the keyword var.

  @Description: Check that a variable inside the class can not be declared with the keyword '%s'

  @Mode: compileonly

  @Negative: yes

  @Structure: single

  @Issue: 0006231
*/

class A {
    %s x: Int64 = 1
}

main() {
}
'''

keywords = ["as", "break", "Bool", "case", "catch", "class", "continue", "Rune", "do", "else", "enum", "extend",
            "false", "finally", "for", "foreign", "from", "func", "Float16", "Float32", "Float64", "if", "import", "in", "init",
            "interface", "is", "Int8", "Int16", "Int32", "Int64", "IntNative", "macro", "match", "mut",
            "main", "Nothing", "operator", "package", "prop", "quote", "return", "spawn", "struct", "static", "super", "synchronized",
            "this", "throw", "true", "try", "type", "This", "unsafe", "UInt8", "UInt16", "UInt32", "UInt64", "UIntNative",
            "Unit", "where", "while", "inout", "abstract",  "open", "override", "private", "protected", "public",
            "redef", "get", "set", "sealed"]

def iterate():
  testcase = 11
  for s in keywords:
    with open(f'./test_a01_{testcase:02d}.cj', 'w', encoding='utf-8') as f:
      f.write(template % (testcase, s, s))
      testcase+= 1

iterate()