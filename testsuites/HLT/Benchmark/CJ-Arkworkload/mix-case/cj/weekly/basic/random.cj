/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2026. All rights reserved.
 * This source file is part of the Cangjie project, licensed under Apache-2.0
 * with Runtime Library Exception.
 * 
 * See https://cangjie-lang.cn/pages/LICENSE for license information.
 */


let RNG_FIXED_SEED = 49734321
let RANDOM_MIN_BOND = 0.0
let RANDOM_MAX_BOND = 1.0
let CONST_ZERO = 0
let MAX_INT_32BIT = 0xffffffff

let RAND_SEED_OFFSET1 = 0x7ed55d16
let RAND_SEED_OFFSET2 = 0xc761c23c
let RAND_SEED_OFFSET3 = 0x165667b1
let RAND_SEED_OFFSET4 = 0xd3a2646c
let RAND_SEED_OFFSET5 = 0xfd7046c5
let RAND_SEED_OFFSET6 = 0xb55a4f09

let RAND_SEED_OFFSET_SHORT1 = 12
let RAND_SEED_OFFSET_SHORT2 = 19
let RAND_SEED_OFFSET_SHORT3 = 5
let RAND_SEED_OFFSET_SHORT4 = 9
let RAND_SEED_OFFSET_SHORT5 = 3
let RAND_SEED_OFFSET_SHORT6 = 16

let RAND_DENOMINATOR = 0x10000000

class RandomGenerator {

    var fixedSeed = RNG_FIXED_SEED

    func createRNG() : () -> Float64 {
        return {  => 
            if (let self <- this ){
                fixedSeed = ((fixedSeed + 0x7ed55d16) + (this.fixedSeed << RAND_SEED_OFFSET_SHORT1))  & 0xffffffff
                fixedSeed = ((fixedSeed ^ 0xc761c23c) ^ (fixedSeed >> RAND_SEED_OFFSET_SHORT2)) & 0xffffffff
                fixedSeed = ((fixedSeed + 0x165667b1) + (fixedSeed << RAND_SEED_OFFSET_SHORT3))   & 0xffffffff
                fixedSeed = ((fixedSeed + 0xd3a2646c) ^ (fixedSeed << RAND_SEED_OFFSET_SHORT4))   & 0xffffffff
                fixedSeed = ((fixedSeed + 0xfd7046c5) + (fixedSeed << RAND_SEED_OFFSET_SHORT5))   & 0xffffffff
                fixedSeed = ((fixedSeed ^ 0xb55a4f09) ^ (fixedSeed >> RAND_SEED_OFFSET_SHORT6)) & 0xffffffff
                return Float64((this.fixedSeed & 0xfffffff)) / Float64(0x10000000)
            }else{
                return 0.0
            }
        }
    }

    func createRNGWithFixedSeed() : () -> Float64 {
        return createRNG()
    }

}
