/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt
// RUN-EXEC-PIPE: %run %run_opt %output %run_utest_opt %run_args --bench 

import std.sync.*

@Attribute[TEST_GENERATED] class Test_Bench_01 <: TestClass {
  var count1 = AtomicInt64(0)
  public func afterAll(): Unit {
      if(count1.load() >= 6 && count1.load() <= 7) {
          println("running benchmark case01")
      }
   }
   @Attribute[Bench_1, Configure_0]
   func case01(): Unit {
   }
  
   
   init() {
   }
   private func classConfiguration(): Configuration {
       let configuration = Configuration()
       
       return configuration
   }
   public override func asTestSuite(): TestSuite {
       
       let suiteConfiguration = classConfiguration()
       let suiteBuilder = TestSuite.builder("Test_Bench_01").configure(suiteConfiguration)
       let m__: Array < Measurement >=[TimeNow()]
       for(m___ in m__) {
           
           { => let caseConfig = Configuration()
               caseConfig.set(KeyMinBatches.minBatches, 5)
               caseConfig.set(KeyMeasurementInfo.measurementInfo, m___.info)
               let case01BenchDataStrategy = DataStrategyProcessor < Unit >.start({ =>[()] }, "")
               
               suiteBuilder.add(
               case01BenchDataStrategy.intoBenchmark(
               caseName: "case01",
               doRun: { prov___, count___: Int64, max___: Int64 =>
                   
                   m___.setup()
                   let _ = prov___
                   do {
                       
                       let tmp_ = m___.measure()
                       for(q___ in 0 .. max___) {
                           
                           if(q___ < count___) {
                               case01()
                           }
                       }
                       return m___.measure() - tmp_
                   } while(false)
                   0.0
               },
               configuration: caseConfig
               )
               )
               
           }()
       }
        
        suiteBuilder.afterAll {
            => afterAll()
            
        }
        return suiteBuilder.build()
    }
    private func inheritedFromClassAnnotatedByTestTemplate < T >(): TestSuite where T <: TestClass {
        throw Exception("Unreachable code")
    }
}


interface TestPackageExtension_Test_Bench_01 {
    func registerTest_Bench_01(): Unit
}
extend TestPackage <: TestPackageExtension_Test_Bench_01 {
    @Attribute[TEST_REGISTER]
    public func registerTest_Bench_01() {
        registerSuite({ => Test_Bench_01().asTestSuite() })
    }
}
