; NOTE: Assertions have been autogenerated by utils/update_test_checks.py
; DO NOT EDIT -- This file was generated from test/CodeGen/CHERI-Generic/Inputs/cheri-csub.ll
; RUN: %riscv64_cheri_llc %s -o - | FileCheck %s --check-prefix=HYBRID
; RUN: %riscv64_cheri_purecap_llc %s -o - | FileCheck %s --check-prefix=PURECAP

define i64 @subp(i8 addrspace(200)* readnone %a, i8 addrspace(200)* readnone %b) nounwind {
; HYBRID-LABEL: subp:
; HYBRID:       # %bb.0: # %entry
; HYBRID-NEXT:    csub a0, ca0, ca1
; HYBRID-NEXT:    ret
;
; PURECAP-LABEL: subp:
; PURECAP:       # %bb.0: # %entry
; PURECAP-NEXT:    csub a0, ca0, ca1
; PURECAP-NEXT:    cret
entry:
  %0 = tail call i64 @llvm.cheri.cap.diff.i64(i8 addrspace(200)* %a, i8 addrspace(200)* %b)
  ret i64 %0
}

declare i64 @llvm.cheri.cap.diff.i64(i8 addrspace(200)*, i8 addrspace(200)*)
