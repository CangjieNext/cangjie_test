// random seed:1701333133384
// All global variable need to be defined before use!









import f1.f2.f3.* 

public const var_1701333133384_294: Float64 = - 88.0 

public const func func_1701333133384_27(modified_param_1701333133384_28: Rune, param_1701333133384_29: Float64, pteTets!: Int64 = 12): Int64 { 
    func_1701333133384_32 < Int8, Int64 >(namedParam_1701333133384_33: var_1701333133384_294, optionalParam_1701333133384_36: 35) 
    - 95 & 70 
} 

main(): Int64 { 
    try { 
        () 
        
        var loopTimeVar_1701333133384_25: Int64 = 0 
        do { 
            loopTimeVar_1701333133384_25 ++ 
            var_1701333133384_17 
            var_1701333133384_21 <<=((Int64(51)) & 7) 
        } while((try { 
            true 
        } catch(e: Exception) { 
            "!Sf5 zz}h8" 
            var_1701333133384_13 
        }) && loopTimeVar_1701333133384_25 < 100) 
        func_1701333133384_27(r'c', try { 
            var_1701333133384_306 
        } catch(e: Exception) { 
            UInt64(40) ^ UInt64(111) 
            var_1701333133384_198 
            (var_1701333133384_294, UInt16(45), UInt32(142), var_1701333133384_294, Int16(- 25), Float64(29.0), "H6hONN)^(D") 
        }[3]) 
        
        var crcCheck = CrcCheck(5000, 32) 
        crcCheck.crcCheck() 
        crcCheck.getCrcOutput() 
        () 
    } catch(e: NoneValueException) { 
        println("Exception: NoneValueException") 
    } 
    return 0 
} 

class CrcCheck { 
    var buffer: Array < Int64 > 
    
    var poly: Array < Int64 > 
    
    var crc_output: Array < Int64 > 
    
    var poly_n: Int64 
    
    var buffer_index: Int64 
    
    var crc_output_n: Int64 
    
    init(modified_buffer_n: Int64, crc_n: Int64, pteTets!: Int64 = 12) { 
        buffer_index = 0 
        crc_output_n = 0 
        crc_output = Array < Int64 >(crc_output_n, { i => 0 }) 
        buffer = Array < Int64 >(modified_buffer_n, { i => 0 }) 
        poly_n = crc_n + 1 
        if(crc_n == 32) { 
            poly = [1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 0, 1, 0, 0, 1, 1, 1] 
        } else if(crc_n == 16) { 
            poly = [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1]
        } else if(crc_n == 8) { 
            poly = [1, 0, 0, 0, 0, 0, 1, 1, 1] 
        } else { 
            poly = [1, 1, 0, 0, 1]
        } 
    } 
    
    func updateBuffer(modified_input: UInt64, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        
        var value = modified_input 
        if(byte_n == 64) { 
            value = value & 0xffffffffffffffff 
        } else if(byte_n == 32) { 
            value = value & 0xffffffff 
        } else if(byte_n == 16) { 
            value = value & 0xffff 
        } else { 
            value = value & 0xff 
        } 
        
        var byteArray = Array < Int64 >(byte_n, { i => 0 }) 
        
        var byte_c = 1 
        
        var byte_index = 0 
        while(value != 0) { 
            if(value % 2 == 1) { 
                byte_index = byte_n - byte_c 
                byteArray[byte_index] = 1 
            } 
            byte_c ++ 
            value = value >> 1 
        } 
        
        var i = 0 
        while(i + byte_index < byte_n) { 
            buffer[(i + buffer_index) % buffer.size] = byteArray[i + byte_index] 
            i ++ 
        } 
        buffer_index =(buffer_index + i) % buffer.size 
    } 
    
    func updateBuffer(modified_input: Bool, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        if(modified_input == true) { 
            updateBuffer(1, byte_n) 
        } else { 
            updateBuffer(0, byte_n) 
        } 
    } 
    
    func updateBuffer(modified_input: Rune, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        updateBuffer(UInt64(UInt32(modified_input)), byte_n) 
    } 
    
    func updateBuffer(modified_input: String, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        for(c in modified_input) { 
            updateBuffer(c, byte_n) 
        } 
    } 
    
    func updateBuffer(modified_input: Unit, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        updateBuffer(modified_input.toString(), byte_n) 
    } 
    
    func updateBuffer(modified_input: Any, byte_n: Int64, pteTets!: Int64 = 12): Unit { 
        if(modified_input is Hashable) { 
            match(modified_input as Hashable) { case Some(v) => updateBuffer(UInt64(v.hashCode()), byte_n) 
                case cjTest28836582028481968 => updateBuffer(1, byte_n) 
            } 
        } else if(modified_input is ToString) { 
            match(modified_input as ToString) { case Some(v) => updateBuffer(v.toString(), byte_n) 
                case cjTest28836582030746419 => updateBuffer(1, byte_n) 
            } 
        } else { 
            updateBuffer(1, byte_n) 
        } 
    } 
    
    func crcCheck(pteTets!: Int64 = 12): Unit { 
        crc_output_n = buffer_index + poly_n - 1 
        
        var crc_buffer = Array < Int64 >(crc_output_n, { i => 0 }) 
        
        var i = 0 
        while(i < buffer_index) { 
            crc_buffer[i] = buffer[i] 
            i ++ 
        } 
        i = 0 
        while(i < buffer_index) { 
            if(crc_buffer[i] == 1) { 
                
                var j = 0 
                while(j < poly_n) { 
                    crc_buffer[j + i] = crc_buffer[j + i] ^ poly[j] 
                    j ++ 
                } 
            } 
            i ++ 
        } 
        
        let check_code = crc_buffer[buffer_index ..] 
        
        var byte_add = 3 - crc_output_n % 3 
        crc_output_n = byte_add + crc_output_n 
        crc_output = Array < Int64 >(crc_output_n, { i => 0 }) 
        i = 0 
        while(i < crc_output_n - byte_add) { 
            if(i < buffer_index) { 
                crc_output[i + byte_add] = buffer[i] 
            } else { 
                crc_output[i + byte_add] = check_code[i - buffer_index] 
            } 
            i ++ 
        } 
    } 
    
    func getCrcOutput(pteTets!: Int64 = 12): Unit { 
        
        var i = 0 
        while(i < crc_output_n) { 
            
            var hex_value = 2 ** 2 * crc_output[i] + 2 ** 1 * crc_output[i + 1] + 1 * crc_output[i + 2] 
            print(hex_value.toString()) 
            i = i + 3 
        } 
        print("\n") 
    } 
} 



// Copyright (c) Huawei Technologies Co., Ltd. 2025. All rights reserved.
// This source file is part of the Cangjie project, licensed under Apache-2.0
// with Runtime Library Exception.
//
// See https://cangjie-lang.cn/pages/LICENSE for license information.
