/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

import std.sync.*
import std.time.*
import std.convert.*
import std.collection.*

var reps: Int64 = 166205832

func benchmarkwaitgroupwaitlogic(localWork:Int64):Unit{
    var futs: ArrayList<Future<Unit>>=ArrayList<Future<Unit>>()//go原码var wg WaitGroup
    b.RunParallel(benchmarkwaitgroup(futs,localWork))//缺少b.RunParallel
}
func benchmarkwaitgroup(futt:ArrayList<Future<Unit>>,localWorkt:Int64):Unit{
    var foo=0 // foo := 0
    //缺少*testing.PB,此处对应pb.Next():判断是否有更多的迭代要执行.Pb:PB 被 RunParallel 使用来运行并行基准测试。go原码：for pb.Next()
    //下边的放在上边缺少的循环里边
    let fut=spawn{  =>
                    for (i in 0..futt.size)//wg.Wait()
                    {
                        futt[i].get()
                    }
                    for (j in 0..localWorkt){
                        foo *= 2
                        foo /= 2
                    }
                    //仓颉没找到对应_ = foo
                }
    futt.add(fut)
}

main(): Int64 {
    var startTime: DateTime
    var endTime: DateTime
    var perTime: Float64
    startTime = DateTime.now()
    benchmarkwaitgroupwaitlogic(100)
    endTime = DateTime.now()
    perTime = Float64((endTime - startTime).toNanoseconds())/Float64(reps)

    println("BenchmarkWaitGroupWaitWork: " + perTime.format(".2") + " ns/op")
    return 0
}
