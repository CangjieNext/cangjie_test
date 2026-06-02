
template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Name:         03_01_a03_%03d

  @Assertion:    3.1(3) A name uniquely represents one entity in any scope. That is, entities in the same
                  scope are not allowed to have the same name, except the names that make up overloading.
                  
  @Description:  Check that %s and %s cannot have the same name in the same scope

  @Mode:         compileonly

  @Negative:     yes

  @Structure:    single

  @Comment:

*/

%s

%s

main() {}
'''

entities = ['let', 'var', 'func', 
            'class', 'interface', 'struct', 
            'enum', 'type', 'package', 
            'module']

entities_name = {
  'let':'immutable variable',
  'var':'mutable variable',
  'func':'function',
  'class':'class',
  'interface':'interface',
  'struct':'struct',
  'enum':'enum',
  'type':'type alias',
  'package':'package',
  'module':'module',
}

entity_template = {
  'let':'let name = 0',
  'var':'var name = 1',
  'func':'func name() {}',
  'class':'class name {}',
  'interface':'interface name {}',
  'struct':'struct name {}',
  'enum':'enum name { x }',
  'type':'type name = (Int64, Int64)',
  'package':'package name',
  'module':'from mn import pkg.AuxModule as name'
}

def main():
  '''Generating tests for assert 3.1(3)'''
  start_generation = 11  # offset so as not to overwrite manual tests
  i = start_generation
  for entity_a in entities:
    for entity_b in entities:
      if entity_b not in ('module','package'):
        with open(f'./test_a03_{i:03d}.cj', 'w', encoding='utf-8') as f:
          init_template_a = entity_template.get(entity_a)
          init_template_b = entity_template.get(entity_b)
          source_test = template % (i, entities_name.get(entity_a), entities_name.get(entity_b), init_template_a, init_template_b)
          if 'module' in entity_a:
            source_test = source_test.splitlines()
            source_test[16] = '  @Structure: complex-main\n\n  @Dependencies: aux_module.cj'
            source_test = "\n".join(source_test)
          f.writelines(source_test)
          i+= 1

  print(f'Total tests generated: {i - start_generation}')

if __name__ == '__main__':
  main()