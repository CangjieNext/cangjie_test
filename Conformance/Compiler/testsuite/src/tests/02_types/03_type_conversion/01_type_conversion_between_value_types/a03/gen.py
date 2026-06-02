import random
import sys

template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Assertion:    2.3.1(3) Type conversion between all numeric types (including Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64, UIntNative, Float16, Float32 and Float64).

  @Description:  Check that the type conversion from TYPE1 to TYPE2 is supported

  @Mode:         run

  @Negative:     no
*/

from utils import utils.assert.Assert

let a1: TYPE1 = VAL1
var a2: TYPE1 = VAL2

func foo(): TYPE1 { return VAL3 }

class MyCls {
    static var m: TYPE1 = VAL4
}

var r1 = TYPE2(a1)
let r2 = TYPE2(a2)

main(): Unit {
    let r3 = TYPE2(foo())
    var r4 = TYPE2(MyCls.m)

    Assert.isTrue(r1 is TYPE2)
    Assert.isTrue(r2 is TYPE2)
    Assert.isTrue(r3 is TYPE2)
    Assert.isTrue(r4 is TYPE2)

    Assert.EQUALS(CHECK1, r1)
    Assert.EQUALS(CHECK2, r2)
    Assert.EQUALS(CHECK3, r3)
    Assert.EQUALS(CHECK4, r4)
}
'''

max_int = sys.maxsize
min_int = -sys.maxsize - 1

int_types = {'Int8':        range(-128, 127), 
             'Int16':       range(-32768, 32767),
             'Int32':       range(-2147483648, 2147483647), 
             'Int64':       range(min_int, max_int), 
             'IntNative':   range(min_int, max_int),
             'UInt8':       range(0, 255), 
             'UInt16':      range(0, 65535),
             'UInt32':      range(0, 4294967295),
             'UInt64':      range(0, max_int), 
             'UIntNative':  range(0, max_int)}

fl_types = {'Float16':      range(-65504, 65504),
            'Float32':      range(-2147483648, 2147483647),
            'Float64':      range(min_int, max_int)}

fl_suffix = {'Float16':     '.0f16',
             'Float32':     '.0f32',
             'Float64':     '.0f64'}

def range_intersect(r1, r2):
    return range(max(r1.start,r2.start), min(r1.stop,r2.stop)) or None

def main():
  '''Generating tests for assert 2.3.1(3)'''  
  start_generation = 1  # offset so as not to overwrite manual tests
  i = start_generation
  
  for type1 in int_types:
    for type2 in int_types:
      with open(f'./test_a03_{i:03d}.cj', 'w', encoding='utf-8') as f:
        source_test = template.replace('TYPE1', type1)
        source_test = source_test.replace('TYPE2', type2)
        source_test = source_test.replace('EQUALS', 'equals')

        common_range = range_intersect(int_types[type1], int_types[type2])

        val1 = random.randrange(common_range.start, common_range.stop)
        val2 = random.randrange(common_range.start, common_range.stop)
        val3 = random.randrange(common_range.start, common_range.stop)
        val4 = random.randrange(common_range.start, common_range.stop)

        source_test = source_test.replace('VAL1', str(val1))
        source_test = source_test.replace('VAL2', str(val2))
        source_test = source_test.replace('VAL3', str(val3))
        source_test = source_test.replace('VAL4', str(val4))
        source_test = source_test.replace('CHECK1', str(val1))
        source_test = source_test.replace('CHECK2', str(val2))
        source_test = source_test.replace('CHECK3', str(val3))
        source_test = source_test.replace('CHECK4', str(val4))
        f.writelines(source_test)
        i+= 1
            
    for type2 in fl_types:
      with open(f'./test_a03_{i:03d}.cj', 'w', encoding='utf-8') as f:
        source_test = template.replace('TYPE1', type1)
        source_test = source_test.replace('TYPE2', type2)
        source_test = source_test.replace('EQUALS', 'approxEquals')

        common_range = range_intersect(int_types[type1], fl_types[type2])

        val1 = random.randrange(common_range.start, common_range.stop)
        val2 = random.randrange(common_range.start, common_range.stop)
        val3 = random.randrange(common_range.start, common_range.stop)
        val4 = random.randrange(common_range.start, common_range.stop)

        source_test = source_test.replace('VAL1', str(val1))
        source_test = source_test.replace('VAL2', str(val2))
        source_test = source_test.replace('VAL3', str(val3))
        source_test = source_test.replace('VAL4', str(val4))
        source_test = source_test.replace('CHECK1', str(val1) + fl_suffix[type2])
        source_test = source_test.replace('CHECK2', str(val2) + fl_suffix[type2])
        source_test = source_test.replace('CHECK3', str(val3) + fl_suffix[type2])
        source_test = source_test.replace('CHECK4', str(val4) + fl_suffix[type2])
        f.writelines(source_test)
        i+= 1

  for type1 in fl_types:
    for type2 in int_types:
      with open(f'./test_a03_{i:03d}.cj', 'w', encoding='utf-8') as f:
        source_test = template.replace('TYPE1', type1)
        source_test = source_test.replace('TYPE2', type2)
        source_test = source_test.replace('EQUALS', 'equals')

        common_range = range_intersect(fl_types[type1], int_types[type2])

        val1 = random.randrange(common_range.start, common_range.stop)
        val2 = random.randrange(common_range.start, common_range.stop)
        val3 = random.randrange(common_range.start, common_range.stop)
        val4 = random.randrange(common_range.start, common_range.stop)

        source_test = source_test.replace('VAL1', str(val1) + fl_suffix[type1])
        source_test = source_test.replace('VAL2', str(val2) + fl_suffix[type1])
        source_test = source_test.replace('VAL3', str(val3) + fl_suffix[type1])
        source_test = source_test.replace('VAL4', str(val4) + fl_suffix[type1])
        source_test = source_test.replace('CHECK1', str(val1))
        source_test = source_test.replace('CHECK2', str(val2))
        source_test = source_test.replace('CHECK3', str(val3))
        source_test = source_test.replace('CHECK4', str(val4))
        f.writelines(source_test)
        i+= 1
					
    for type2 in fl_types:
      with open(f'./test_a03_{i:03d}.cj', 'w', encoding='utf-8') as f:
        source_test = template.replace('TYPE1', type1)
        source_test = source_test.replace('TYPE2', type2)
        source_test = source_test.replace('EQUALS', 'approxEquals')

        common_range = range_intersect(fl_types[type1], fl_types[type2])

        val1 = random.randrange(common_range.start, common_range.stop)
        val2 = random.randrange(common_range.start, common_range.stop)
        val3 = random.randrange(common_range.start, common_range.stop)
        val4 = random.randrange(common_range.start, common_range.stop)

        source_test = source_test.replace('VAL1', str(val1) + fl_suffix[type1])
        source_test = source_test.replace('VAL2', str(val2) + fl_suffix[type1])
        source_test = source_test.replace('VAL3', str(val3) + fl_suffix[type1])
        source_test = source_test.replace('VAL4', str(val4) + fl_suffix[type1])
        source_test = source_test.replace('CHECK1', str(val1) + fl_suffix[type2])
        source_test = source_test.replace('CHECK2', str(val2) + fl_suffix[type2])
        source_test = source_test.replace('CHECK3', str(val3) + fl_suffix[type2])
        source_test = source_test.replace('CHECK4', str(val4) + fl_suffix[type2])
        f.writelines(source_test)
        i+= 1

  print(f'Total tests generated: {i - start_generation}')


if __name__ == '__main__':
  main()