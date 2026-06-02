/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

/*
  @Name:         03_03_01_a20_01

  @Level:         1

  @Assertion:    3.3.1(20) In addition to the preceding syntax definitions, local variables may be introduced 
                 in the following scenarios: Pattern between for and in in the for-in loop expression. 
                 For details, see The for-in Expression.

  @Description:  Using for-in expression with varBinding patterns

  @Mode:         run

  @Negative:     no

  @Structure:    single

*/

import utils.assert.Assert

type MyArrItemTupleType = (Int64, Rune)

enum TimeUnits {
    Year(String)
}

class MyClass {
    private var yearsList: String
    MyClass(inArr: Array<TimeUnits>) {
      var tmpList = ""
      for(Year(newLocalVar) in inArr) {
          if(tmpList=="") {
            tmpList = newLocalVar
          } else {
            tmpList = tmpList + ";" + newLocalVar
          }
      }

      this.yearsList = tmpList
    }

    public func getYearsList() {
        this.yearsList
    }
}

func iterateTupleArr(inArr: Array<MyArrItemTupleType>) {
    var tmpCount = 0
    for( (x, _) in inArr) {
        print("${x}")
        var (xVar, yVar) = inArr[tmpCount]
        Assert.equals(x, xVar)
        tmpCount++
    }
}

main() {
    var tmpCount = 0
    let tmpArr = ["1", "AAA", "Y"]
    for(item in tmpArr) {
        print("${item}")
        Assert.equals(item, tmpArr[tmpCount])
        tmpCount++
    }

    var myClassImpl = MyClass([Year("2012"), Year("1947")])
    print("${myClassImpl.getYearsList()}")
    let myTuplesArr: Array<MyArrItemTupleType> = [(28, r'H'), (64, r'P'), (-5, r'Q'), (22, r'v'), (1793, r'T'), (0, r'm')]
    iterateTupleArr(myTuplesArr)
}