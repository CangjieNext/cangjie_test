/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:            05_03_04_a03_01

  @Level:         1

  @Assertion:       5.3.4(3) 2.Variable-length arguments can be used to pass elements of an array one by one in the 
                    form of a normal argument list when the function is called.

  @Description:     Check that variable-length arguments allow to pass elements of an array one by one or as array 
                    when function called.

  @Mode:            run

  @Negative:        no

  @Structure:       single

*/
import utils.assert.Assert

class myClass {
    func f0(arr: Array<Float16>): Int64 { return arr.size }
    func f1(a: Rune, arr: Array <Rune>): String { 
        if(arr.size == 0) {
            return "${a} + 0" 
        }
        return "${a} + ${arr[arr.size-1]}" 
    }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

struct myStruct {
    func f0(arr: Array<Rune>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

enum myEnum {

    S

    func f0(arr: Array<Bool>): Int64 { return arr.size }
    func f1(a: Int64, arr: Array <Int64>): Int64 { return a + arr.size }
    func f2(a: Int64, arr: Array <Int64>, b!: Int64): Int64 { return a + arr.size + b }
}

func f0(arr: Array<String>): Int64 { return arr.size }
func f1(a: Int64, arr: Array<Int64>): Int64 { return a + arr.size }
func f2(a: Int64, arr: Array<Float32>, b!: Int64): Int64 { return a + arr.size + b }


main() {
    Assert.equals(3, f0(["AAA", "2", "8gjgaw"]))
    Assert.equals(3, f0("AAA", "2", "8gjgaw"))
    Assert.equals(2, f0("AAA", "2"))
    Assert.equals(2, f0(["AAA", "2"]))
    Assert.equals(1, f0("AAA"))
    Assert.equals(1, f0(["AAA"]))
    Assert.equals(0, f0())
    Assert.equals(0, f0([]))

    Assert.equals(6, f1(3, [1,2,3]))
    Assert.equals(6, f1(3, 1,2,3))
    Assert.equals(5, f1(3, 1,2))
    Assert.equals(5, f1(3, [1,2]))
    Assert.equals(4, f1(3, [1]))
    Assert.equals(4, f1(3, 1))
    Assert.equals(3, f1(3, []))
    Assert.equals(3, f1(3))

    Assert.equals(28, f2(3, [1.5, 2.13, 3.099], b: 22))
    Assert.equals(19, f2(3, 1.5, 2.13, 3.099, b:13))
    Assert.equals(-2, f2(3, 1.5, 2.13, b: -7))
    Assert.equals(-2, f2(3, [1.5, 2.13], b: -7))
    Assert.equals(9, f2(3, 1.5, b: 5))
    Assert.equals(9, f2(3, [1.5], b: 5))
    Assert.equals(3, f2(3, [], b: 0))
    Assert.equals(3, f2(3, b: 0))

    var myClassImpl = myClass()
    Assert.equals(3, myClassImpl.f0([1.5, 2.13, 3.099]))
    Assert.equals(3, myClassImpl.f0(1.5, 2.13, 3.099))
    Assert.equals(2, myClassImpl.f0(1.5, 2.13))
    Assert.equals(2, myClassImpl.f0([1.5, 2.13]))
    Assert.equals(1, myClassImpl.f0(1.5))
    Assert.equals(1, myClassImpl.f0([1.5]))
    Assert.equals(0, myClassImpl.f0())
    Assert.equals(0, myClassImpl.f0([]))

    Assert.equals("d + R", myClassImpl.f1(r'd', [r'1', r'h', r'R']))
    Assert.equals("d + R", myClassImpl.f1(r'd', r'1', r'h', r'R'))
    Assert.equals("d + h", myClassImpl.f1(r'd', r'1', r'h'))
    Assert.equals("d + 1", myClassImpl.f1(r'd', r'1'))
    Assert.equals("d + 0", myClassImpl.f1(r'd'))

    Assert.equals(28, myClassImpl.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myClassImpl.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myClassImpl.f2(3, 1,2, b: -7))
    Assert.equals(-2, myClassImpl.f2(3, [1,2], b: -7))
    Assert.equals(9, myClassImpl.f2(3, [1], b: 5))
    Assert.equals(9, myClassImpl.f2(3, 1, b: 5))
    Assert.equals(3, myClassImpl.f2(3, b: 0))
    Assert.equals(3, myClassImpl.f2(3, [], b: 0))

    var myStructImpl = myStruct()
    Assert.equals(3, myStructImpl.f0([r'K',r'g',r'k']))
    Assert.equals(3, myStructImpl.f0(r'K',r'g',r'k'))
    Assert.equals(2, myStructImpl.f0([r'K',r'g']))
    Assert.equals(2, myStructImpl.f0(r'K',r'g'))
    Assert.equals(1, myStructImpl.f0([r'K']))
    Assert.equals(1, myStructImpl.f0(r'K'))
    Assert.equals(0, myStructImpl.f0([]))
    Assert.equals(0, myStructImpl.f0())

    Assert.equals(6, myStructImpl.f1(3, [1,2,3]))
    Assert.equals(6, myStructImpl.f1(3, 1,2,3))
    Assert.equals(5, myStructImpl.f1(3, [1,2]))
    Assert.equals(5, myStructImpl.f1(3, 1,2))
    Assert.equals(4, myStructImpl.f1(3, [1]))
    Assert.equals(4, myStructImpl.f1(3, 1))
    Assert.equals(3, myStructImpl.f1(3))
    Assert.equals(3, myStructImpl.f1(3, []))

    Assert.equals(28, myStructImpl.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myStructImpl.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myStructImpl.f2(3, [1,2], b: -7))
    Assert.equals(-2, myStructImpl.f2(3, 1,2, b: -7))
    Assert.equals(9, myStructImpl.f2(3, [1], b: 5))
    Assert.equals(9, myStructImpl.f2(3, 1, b: 5))
    Assert.equals(3, myStructImpl.f2(3, b: 0))
    Assert.equals(3, myStructImpl.f2(3, [], b: 0))

    Assert.equals(3, myEnum.S.f0([true,false,true]))
    Assert.equals(3, myEnum.S.f0(true,false,true))
    Assert.equals(2, myEnum.S.f0([true,false]))
    Assert.equals(2, myEnum.S.f0(true,false))
    Assert.equals(1, myEnum.S.f0([true]))
    Assert.equals(1, myEnum.S.f0(true))
    Assert.equals(0, myEnum.S.f0())
    Assert.equals(0, myEnum.S.f0([]))

    Assert.equals(6, myEnum.S.f1(3, [1,2,3]))
    Assert.equals(6, myEnum.S.f1(3, 1,2,3))
    Assert.equals(5, myEnum.S.f1(3, [1,2]))
    Assert.equals(5, myEnum.S.f1(3, 1,2))
    Assert.equals(4, myEnum.S.f1(3, 1))
    Assert.equals(4, myEnum.S.f1(3, [1]))
    Assert.equals(3, myEnum.S.f1(3))
    Assert.equals(3, myEnum.S.f1(3, []))

    Assert.equals(28, myEnum.S.f2(3, [1,2,3], b: 22))
    Assert.equals(19, myEnum.S.f2(3, 1,2,3, b:13))
    Assert.equals(-2, myEnum.S.f2(3, [1,2], b: -7))
    Assert.equals(-2, myEnum.S.f2(3, 1,2, b: -7))
    Assert.equals(9, myEnum.S.f2(3, 1, b: 5))
    Assert.equals(3, myEnum.S.f2(3, b: 0))
    Assert.equals(9, myEnum.S.f2(3, [1], b: 5))
    Assert.equals(3, myEnum.S.f2(3, [], b: 0))
}
