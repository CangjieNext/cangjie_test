template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Assertion:   11.1.5.1(8) If a unique main method is found, the compiler will 
                further check its parameter and return value type. The main can have
                no parameter or parameter of type Array<String> and return value of type
                Unit or integer.

  @Description: Check that main method cannot have return value of type %s.

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

  @Comment:     Auto-generated test by neg_gen_bad_ret_val.py
*/

main(%s) {
%s
}

'''
# keywords (without contextual keywords)
param_types = ["", "Array<String>"]

ret_types = ["Float16", "Float32", "Float64", "Bool", "String", "Rune"]

def init_val(init_type):
  if "Float" in init_type:
    init = "0.0"
  elif "Bool" in init_type:
    init = "true"
  elif "String" in init_type:
    init = '"str"'
  elif "Rune" in init_type:
    init = "'c'"
  return f"    var i : {init_type} = {init}\n    return i"

def main():
  '''Generating tests for assert 11.1.5.1(8)'''
  start_generation = 23  # offset so as not to overwrite manual tests
  i = start_generation
  for ret_val in ret_types:
    func_body = init_val(ret_val)
    for param in param_types:
      if param != "":
        param = f"p1: {param}"       
      with open(f'./test_a08_{i:03d}.cj', 'w', encoding='utf-8') as f:
        f.write(template % (ret_val, param, func_body))
        i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()