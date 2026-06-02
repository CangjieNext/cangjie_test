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

  @Description: Check that main method cannot have parameter of type %s.

  @Mode:        compileonly

  @Negative:    yes

  @Structure:   single

  @Comment:     Auto-generated test by neg_gen_bad_param.py
*/

main(p1: %s) {
%s
}

'''
# keywords (without contextual keywords)
param_types = ["Int8", "Int16", "Int32", "Int64", "IntNative", "UInt8", "UInt16", "UInt32", "Uint64", "UIntNative",
         "Float16", "Float32", "Float64", "Bool", "String", "Rune", "Array<Int8>", "Array<Int16>", "Array<Int32>", 
         "Array<Int64>", "Array<IntNative>", "Array<UInt8>", "Array<UInt16>", "Array<UInt32>", "Array<Uint64>",
         "Array<UIntNative>", "Array<Float16>", "Array<Float32>", "Array<Float64>", "Array<Bool>", "Array<Rune>"]

ret_types = ["Int8", "Int16", "Int32", "Int64", "IntNative", "UInt8", "UInt16", "UInt32", "UInt64", "UIntNative", "Unit"]

def main():
  '''Generating tests for assert 11.1.5.1(8)'''
  start_generation = 34  # offset so as not to overwrite manual tests
  i = start_generation
  for ret_val in ret_types:
    func_body = f"    var i : {ret_val} = 0\n    return i"
    for param in param_types:    
      with open(f'./test_a08_{i:03d}.cj', 'w', encoding='utf-8') as f:
        f.write(template % (param, param, func_body))
        i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()