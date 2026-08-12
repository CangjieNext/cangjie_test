/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 *
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */

// LEVEL:0
// EXEC: %compiler %cmp_opt %f -o %output %cmp_utest_opt --sanitizer-coverage-trace-pc-guard --sanitizer-coverage-trace-compares 
// EXEC-PIPE: %run %run_opt %output %run_utest_opt --no-color --coverage-guided | compare %f
// ASSERT: scan nextBool =
// ASSERT: scan nextUInt8 =
// ASSERT: scan nextUInt16 =
// ASSERT: scan nextUInt32 =
// ASSERT: scan nextUInt64 =
// ASSERT: scan nextFloat16 =
// ASSERT: scan nextFloat32 =
// ASSERT: scan nextFloat64 =
// ASSERT: scan nextGaussianFloat64 =
// ASSERT: scan suggestBool =
// ASSERT: scan suggestUInt8 =
// ASSERT: scan suggestUInt16 =
// ASSERT: scan suggestUInt32 =
// ASSERT: scan suggestUInt64 =
// ASSERT: scan suggestFloat16 =
// ASSERT: scan suggestFloat32 =
// ASSERT: scan suggestFloat64 =

import std.unittest.*
import std.unittest.common.*
import std.unittest.prop_test.*
import std.unittest.testmacro.*
import std.random.Random

class ActualConfigurationWrapper <: DataStrategy<Configuration> & DataProvider<Configuration> {
    ActualConfigurationWrapper(let actualConfiguration!: Configuration = defaultConfiguration()) {}
    public prop isInfinite: Bool {
        get() {
            false
        }
    }

    public func provide(): Iterable<Configuration> {
        [actualConfiguration]
    }

    public func provider(configuration: Configuration): DataProvider<Configuration> {
        return ActualConfigurationWrapper(actualConfiguration: configuration)
    }
}

@Test[value in random(), configuration in ActualConfigurationWrapper()]
@Configure[randomSeed: 42, generationSteps: 5]
func fooTest(value: Int64, configuration: Configuration): Unit {
    // do not repeat this at home, we extract internals of CGF
    let randomSource = configuration.get(KeyRandom.random) ?? @Fail("Configuration failed")
    // make sure this RandomSource is not normal Random to ensure we're in coverage-guided mode
    if ((randomSource is Random)) {
        return
    }
    // predicting the values is next to impossible in a simple test, so we just make sure they don't crash
    println("nextBool = ${randomSource.nextBool()}")
    println("nextUInt8 = ${randomSource.nextUInt8()}")
    println("nextUInt16 = ${randomSource.nextUInt16()}")
    println("nextUInt32 = ${randomSource.nextUInt32()}")
    println("nextUInt64 = ${randomSource.nextUInt64()}")
    println("nextFloat16 = ${randomSource.nextFloat16()}")
    println("nextFloat32 = ${randomSource.nextFloat32()}")
    println("nextFloat64 = ${randomSource.nextFloat64()}")
    println("nextGaussianFloat64 = ${randomSource.nextGaussianFloat64(mean: 0.0, sigma: 1.0)}")
    println("suggestBool = ${randomSource.suggestBool()}")
    println("suggestUInt8 = ${randomSource.suggestUInt8()}")
    println("suggestUInt16 = ${randomSource.suggestUInt16()}")
    println("suggestUInt32 = ${randomSource.suggestUInt32()}")
    println("suggestUInt64 = ${randomSource.suggestUInt64()}")
    println("suggestFloat16 = ${randomSource.suggestFloat16()}")
    println("suggestFloat32 = ${randomSource.suggestFloat32()}")
    println("suggestFloat64 = ${randomSource.suggestFloat64()}")
}
