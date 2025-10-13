// random seed:1708141110504
// All global variable need to be defined before use!




internal import f1.f2.f3.* 


public const var_1708141110504_101: Float64 = 77.0 
main(): Int64 { 
    try { 
        
        const var_1708141110504_7: Unit =() 
        var_1708141110504_7 
        
        var var_1708141110504_88:(UInt32) -> UInt64 = { lambdaParameter_1708141110504_91: UInt32 => UInt64(166) } 
        Int64((match("'l3Z1YdDn<") { case #"iAZ\\@Dt5 A"# | #"NS&Fpva3#R"# | "=vZ<fsL' J" | "F4 T]N1X4$" => var_1708141110504_101 ** Int64(- 123) 
            var_1708141110504_105 
            case "Hj~49ra{Dt\\" | #"4T(P}SYWf5"# => var_1708141110504_105 /((var_1708141110504_105) | 1) 
            case _ => var_1708141110504_85 
            var_1708141110504_122 -- 
            var_1708141110504_105 
        } |> var_1708141110504_88)) 
        
        var var_1708141110504_582:(Int64) -> Option < Int64 >= { lambdaParameter_1708141110504_585: Int64 =>(() as Int64) } 
        
        ((var_1708141110504_77 |> var_1708141110504_582)??try { 
            var_1708141110504_77 ** UInt64(254) 
        } catch(e: Exception) { 
            Int64(123) 
        } finally { 
            var_1708141110504_77 
        }) 
        
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
    
    init(buffer_n: Int64, crc_n: Int64) { 
        buffer_index = 0 
        crc_output_n = 0 
        crc_output = Array < Int64 >(crc_output_n, { i => 0 }) 
        buffer = Array < Int64 >(buffer_n, { i => 0 }) 
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
    
    func updateBuffer(input: UInt64, byte_n: Int64): Unit { 
        
        var value = input 
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
    
    func updateBuffer(input: Bool, byte_n: Int64): Unit { 
        if(input == true) { 
            updateBuffer(1, byte_n) 
        } else { 
            updateBuffer(0, byte_n) 
        } 
    } 
    
    func updateBuffer(input: Rune, byte_n: Int64): Unit { 
        updateBuffer(UInt64(UInt32(input)), byte_n) 
    } 
    
    func updateBuffer(input: String, byte_n: Int64): Unit { 
        for(c in input) { 
            updateBuffer(c, byte_n) 
        } 
    } 
    
    func updateBuffer(input: Unit, byte_n: Int64): Unit { 
        updateBuffer(input.toString(), byte_n) 
    } 
    
    func updateBuffer(input: Any, byte_n: Int64): Unit { 
        if(input is Hashable) { 
            match(input as Hashable) { case Some(v) => updateBuffer(UInt64(v.hashCode()), byte_n) 
                case _ => updateBuffer(1, byte_n) 
            } 
        } else if(input is ToString) { 
            match(input as ToString) { case Some(v) => updateBuffer(v.toString(), byte_n) 
                case _ => updateBuffer(1, byte_n) 
            } 
        } else { 
            updateBuffer(1, byte_n) 
        } 
    } 
    
    func crcCheck(): Unit { 
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
    
    func getCrcOutput(): Unit { 
        
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
