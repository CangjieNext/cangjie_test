// Auxiliary C++ source for test_ast_no_misbind.cj.
// Mimics harmonyApp's libkn.a: throws a C++ exception, leaving __cxa_throw,
// __gxx_personality_v0, _Unwind_Resume as undefined symbols that the linker
// must resolve from somewhere on the search path. Exported with C linkage so
// the symbol survives stripping and is easy to spot.
#include <stdexcept>

extern "C" void kn_do_throw() {
    throw std::runtime_error("cangjie misbind test");
}
