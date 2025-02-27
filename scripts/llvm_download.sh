#!/bin/bash

mkdir -p llvm-project && pushd llvm-project

git init

git remote add origin git@github.com:llvm/llvm-project.git
# git remote add origin /repo/llvm-project

######

git sparse-checkout set --no-cone \
  /cmake /llvm /mlir \
  '!/llvm/test' '!/llvm/unittests' '!/llvm/docs' \
  '!/mlir/test' '!/mlir/unittests' '!/mlir/docs' \
  /.vscode '/*.*'

git sparse-checkout add \
  '!/llvm/utils/gn' \
  '!/llvm/lib/Target' '/llvm/lib/Target/*.*' \
  '/llvm/lib/Target/RISCV' '/llvm/lib/Target/ARM' '/llvm/lib/Target/AArch64' \
  '/llvm/lib/Target/AMDGPU' 'llvm/lib/Target/NVPTX' 'llvm/lib/Target/X86' \
  'llvm/lib/Target/SPIRV'

git sparse-checkout list

######

# LLVM_SHA="86b69c31642e98f8357df62c09d118ad1da4e16a"
LLVM_SHA="1188b1ff7b956cb65d8ddda5f1e56c432f1a57c7"

git fetch --depth 1 origin $LLVM_SHA
# git checkout -b sync $LLVM_SHA
git checkout $LLVM_SHA

popd

###############################################################################

# old log

# du -hs llvm-project
# 439M    llvm-project

###############################################################################
