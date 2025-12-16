#cd mirror_methods_optional_members && mkdir -p out && cd ..
#cd mirror_methods_optional_members && cjc -j4 --output-type=dylib --int-overflow wrapping -p src/cjworld -linteroplib.objc -lobjc.lang -o out 2>&1 && cd ..
#cd mirror_methods_optional_members && sed -i "s/\.dylib/\.so/g" objc-gen/* && cd ..
cd mirror_methods_optional_members && clang $(gnustep-config --objc-flags) $(gnustep-config --base-libs) -fobjc-arc src/objc/*.m objc-gen/*.m -o out/main -Lout -L$CANGJIE_HOME/runtime/lib/linux_x86_64_cjnative -I../ -Isrc/objc -Iobjc-gen -I$CANGJIE_HOME/include -lcjworld -lcangjie-runtime -ldl && cd ..
cd mirror_methods_optional_members/out && gdb --args ./main && cd ../..