import random
import sys

template = '''# Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
# This source file is part of the Cangjie project, licensed under Apache-2.0
# with Runtime Library Exception.
# 
# See https://cangjie-lang.cn/pages/LICENSE for license information.

/*
  @Assertion:    2.3.1(2) Type conversion from integer types (i.e., Int8, Int16, Int32, Int64, IntNative,
                 UInt8, UInt16, UInt32, UInt64 and UIntNative) to Rune.

  @Description:  Check that the type conversion from TYPE to Rune is supported

  @Mode:         run

  @Negative:     no
*/

from utils import utils.assert.Assert

let a1: TYPE = VAL1
var a2: TYPE = VAL2

func foo(): TYPE { return VAL3 }

class MyCls {
    static var m: TYPE = VAL4
}

var r1 = Rune(a1)
let r2 = Rune(a2)

main(): Unit {
    let r3 = Rune(foo())
    var r4 = Rune(MyCls.m)

    Assert.isTrue(r1 is Rune)
    Assert.isTrue(r2 is Rune)
    Assert.isTrue(r3 is Rune)
    Assert.isTrue(r4 is Rune)

    Assert.equals(VAL1, UInt32(r1))
    Assert.equals(VAL2, UInt32(r2))
    Assert.equals(VAL3, UInt32(r3))
    Assert.equals(VAL4, UInt32(r4))
}
'''

types = {'Int8':        range(0, 127), 
         'Int16':       range(0, 32767),
         'Int32':       range(0, 1114111), 
         'Int64':       range(0, 1114111), 
         'IntNative':   range(0, 127),
         'UInt8':       range(0, 255), 
         'UInt16':      range(0, 65535), 
         'UInt64':      range(0, 1114111), 
         'UIntNative':  range(0, 1114111)}

def main():
  '''Generating tests for assert 2.3.1(1)'''  
  start_generation = 1  # offset so as not to overwrite manual tests
  i = start_generation
  for type in types:
    print(type)
    with open(f'./test_a02_{i:02d}.cj', 'w', encoding='utf-8') as f:
        source_test = template.replace('TYPE', type)
        vals = random.sample(types[type], 4)

        source_test = source_test.replace('VAL1', str(vals[0]))
        source_test = source_test.replace('VAL2', str(vals[1]))
        source_test = source_test.replace('VAL3', str(vals[2]))
        source_test = source_test.replace('VAL4', str(vals[3]))
        f.writelines(source_test)
        i+= 1

  print(f'Total tests generated: {i - start_generation}')


if __name__ == '__main__':
  main()