/* Generated from util/file-string.scm by the CHICKEN compiler
   http://www.call-cc.org
   Version 5.3.0 (rev e31bbee5)
   linux-unix-gnu-x86-64 [ 64bit dload ptables ]
   command line: util/file-string.scm -output-file util/file-string.c
   unit: file-string
   uses: filesystem-macros eval library file data-structures extras
*/
#include "chicken.h"

static C_PTABLE_ENTRY *create_ptable(void);
C_noret_decl(C_filesystem_2dmacros_toplevel)
C_externimport void C_ccall C_filesystem_2dmacros_toplevel(C_word c,C_word *av) C_noret;
C_noret_decl(C_eval_toplevel)
C_externimport void C_ccall C_eval_toplevel(C_word c,C_word *av) C_noret;
C_noret_decl(C_library_toplevel)
C_externimport void C_ccall C_library_toplevel(C_word c,C_word *av) C_noret;
C_noret_decl(C_file_toplevel)
C_externimport void C_ccall C_file_toplevel(C_word c,C_word *av) C_noret;
C_noret_decl(C_data_2dstructures_toplevel)
C_externimport void C_ccall C_data_2dstructures_toplevel(C_word c,C_word *av) C_noret;
C_noret_decl(C_extras_toplevel)
C_externimport void C_ccall C_extras_toplevel(C_word c,C_word *av) C_noret;

static C_TLS C_word lf[12];
static double C_possibly_force_alignment;
static C_char C_TLS li0[] C_aligned={C_lihdr(0,0,9),40,108,111,111,112,32,108,115,41,0,0,0,0,0,0,0};
static C_char C_TLS li1[] C_aligned={C_lihdr(0,0,20),40,95,102,105,108,101,45,62,115,116,114,105,110,103,32,102,105,108,101,41,0,0,0,0};
static C_char C_TLS li2[] C_aligned={C_lihdr(0,0,19),40,102,105,108,101,45,62,115,116,114,105,110,103,32,102,105,108,101,41,0,0,0,0,0};
static C_char C_TLS li3[] C_aligned={C_lihdr(0,0,10),40,116,111,112,108,101,118,101,108,41,0,0,0,0,0,0};


C_noret_decl(f_139)
static void C_ccall f_139(C_word c,C_word *av) C_noret;
C_noret_decl(f_142)
static void C_ccall f_142(C_word c,C_word *av) C_noret;
C_noret_decl(f_145)
static void C_ccall f_145(C_word c,C_word *av) C_noret;
C_noret_decl(f_148)
static void C_ccall f_148(C_word c,C_word *av) C_noret;
C_noret_decl(f_151)
static void C_ccall f_151(C_word c,C_word *av) C_noret;
C_noret_decl(f_154)
static void C_ccall f_154(C_word c,C_word *av) C_noret;
C_noret_decl(f_156)
static void C_ccall f_156(C_word c,C_word *av) C_noret;
C_noret_decl(f_160)
static void C_ccall f_160(C_word c,C_word *av) C_noret;
C_noret_decl(f_162)
static void C_fcall f_162(C_word t0,C_word t1,C_word t2) C_noret;
C_noret_decl(f_166)
static void C_ccall f_166(C_word c,C_word *av) C_noret;
C_noret_decl(f_178)
static void C_ccall f_178(C_word c,C_word *av) C_noret;
C_noret_decl(f_185)
static void C_ccall f_185(C_word c,C_word *av) C_noret;
C_noret_decl(f_197)
static void C_ccall f_197(C_word c,C_word *av) C_noret;
C_noret_decl(f_205)
static void C_ccall f_205(C_word c,C_word *av) C_noret;
C_noret_decl(f_209)
static void C_ccall f_209(C_word c,C_word *av) C_noret;
C_noret_decl(C_file_2dstring_toplevel)
C_externexport void C_ccall C_file_2dstring_toplevel(C_word c,C_word *av) C_noret;

C_noret_decl(trf_162)
static void C_ccall trf_162(C_word c,C_word *av) C_noret;
static void C_ccall trf_162(C_word c,C_word *av){
C_word t0=av[2];
C_word t1=av[1];
C_word t2=av[0];
f_162(t0,t1,t2);}

/* k137 */
static void C_ccall f_139(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void *)f_139,c,av);}
a=C_alloc(3);
t2=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_142,a[2]=((C_word*)t0)[2],tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t2;
C_eval_toplevel(2,av2);}}

/* k140 in k137 */
static void C_ccall f_142(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void *)f_142,c,av);}
a=C_alloc(3);
t2=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_145,a[2]=((C_word*)t0)[2],tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t2;
C_filesystem_2dmacros_toplevel(2,av2);}}

/* k143 in k140 in k137 */
static void C_ccall f_145(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word t4;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(11,c,2)))){
C_save_and_reclaim((void *)f_145,c,av);}
a=C_alloc(11);
t2=C_a_i_provide(&a,1,lf[0]);
t3=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_148,a[2]=((C_word*)t0)[2],tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t3;
C_extras_toplevel(2,av2);}}

/* k146 in k143 in k140 in k137 */
static void C_ccall f_148(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void *)f_148,c,av);}
a=C_alloc(3);
t2=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_151,a[2]=((C_word*)t0)[2],tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t2;
C_data_2dstructures_toplevel(2,av2);}}

/* k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_151(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void *)f_151,c,av);}
a=C_alloc(3);
t2=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_154,a[2]=((C_word*)t0)[2],tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t2;
C_file_toplevel(2,av2);}}

/* k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_154(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word t4;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(6,c,3)))){
C_save_and_reclaim((void *)f_154,c,av);}
a=C_alloc(6);
t2=C_mutate((C_word*)lf[1]+1 /* (set! _file->string ...) */,(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_156,a[2]=((C_word)li1),tmp=(C_word)a,a+=3,tmp));
t3=C_mutate((C_word*)lf[9]+1 /* (set! file->string ...) */,(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_197,a[2]=((C_word)li2),tmp=(C_word)a,a+=3,tmp));
t4=((C_word*)t0)[2];{
C_word *av2=av;
av2[0]=t4;
av2[1]=C_SCHEME_UNDEFINED;
((C_proc)(void*)(*((C_word*)t4+1)))(2,av2);}}

/* _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_156(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2=av[2];
C_word t3;
C_word t4;
C_word *a;
if(c!=3) C_bad_argc_2(c,3,t0);
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void *)f_156,c,av);}
a=C_alloc(3);
t3=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_160,a[2]=t1,tmp=(C_word)a,a+=3,tmp);
C_trace(C_text("util/file-string.scm:30: scheme#open-input-file"));
{C_proc tp=(C_proc)C_fast_retrieve_proc(*((C_word*)lf[8]+1));
C_word *av2=av;
av2[0]=*((C_word*)lf[8]+1);
av2[1]=t3;
av2[2]=t2;
tp(3,av2);}}

/* k158 in _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_160(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word t4;
C_word t5;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(7,c,3)))){
C_save_and_reclaim((void *)f_160,c,av);}
a=C_alloc(7);
t2=C_SCHEME_UNDEFINED;
t3=(*a=C_VECTOR_TYPE|1,a[1]=t2,tmp=(C_word)a,a+=2,tmp);
t4=C_set_block_item(t3,0,(*a=C_CLOSURE_TYPE|4,a[1]=(C_word)f_162,a[2]=t1,a[3]=t3,a[4]=((C_word)li0),tmp=(C_word)a,a+=5,tmp));
C_trace(C_text("util/file-string.scm:39: loop"));
t5=((C_word*)t3)[1];
f_162(t5,((C_word*)t0)[2],lf[7]);}

/* loop in k158 in _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_fcall f_162(C_word t0,C_word t1,C_word t2){
C_word tmp;
C_word t3;
C_word t4;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(6,0,2)))){
C_save_and_reclaim_args((void *)trf_162,3,t0,t1,t2);}
a=C_alloc(6);
t3=(*a=C_CLOSURE_TYPE|5,a[1]=(C_word)f_166,a[2]=t2,a[3]=t1,a[4]=((C_word*)t0)[2],a[5]=((C_word*)t0)[3],tmp=(C_word)a,a+=6,tmp);
C_trace(C_text("util/file-string.scm:32: chicken.io#read-line"));
{C_proc tp=(C_proc)C_fast_retrieve_symbol_proc(lf[6]);
C_word av2[3];
av2[0]=*((C_word*)lf[6]+1);
av2[1]=t3;
av2[2]=((C_word*)t0)[2];
tp(3,av2);}}

/* k164 in loop in k158 in _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_166(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word t4;
C_word t5;
C_word t6;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(4,c,4)))){
C_save_and_reclaim((void *)f_166,c,av);}
a=C_alloc(4);
t2=C_i_string_length(((C_word*)t0)[2]);
t3=C_i_nequalp(t2,C_fix(0));
t4=(C_truep(t3)?lf[2]:lf[3]);
if(C_truep(C_eofp(t1))){
t5=(*a=C_CLOSURE_TYPE|3,a[1]=(C_word)f_178,a[2]=((C_word*)t0)[3],a[3]=((C_word*)t0)[2],tmp=(C_word)a,a+=4,tmp);
C_trace(C_text("util/file-string.scm:36: scheme#close-input-port"));
{C_proc tp=(C_proc)C_fast_retrieve_proc(*((C_word*)lf[4]+1));
C_word *av2;
if(c >= 3) {
  av2=av;
} else {
  av2=C_alloc(3);
}
av2[0]=*((C_word*)lf[4]+1);
av2[1]=t5;
av2[2]=((C_word*)t0)[4];
tp(3,av2);}}
else{
t5=(*a=C_CLOSURE_TYPE|3,a[1]=(C_word)f_185,a[2]=((C_word*)t0)[5],a[3]=((C_word*)t0)[3],tmp=(C_word)a,a+=4,tmp);
C_trace(C_text("util/file-string.scm:38: chicken.string#conc"));
{C_proc tp=(C_proc)C_fast_retrieve_symbol_proc(lf[5]);
C_word *av2;
if(c >= 5) {
  av2=av;
} else {
  av2=C_alloc(5);
}
av2[0]=*((C_word*)lf[5]+1);
av2[1]=t5;
av2[2]=((C_word*)t0)[2];
av2[3]=t4;
av2[4]=t1;
tp(5,av2);}}}

/* k176 in k164 in loop in k158 in _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_178(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(0,c,1)))){
C_save_and_reclaim((void *)f_178,c,av);}
t2=((C_word*)t0)[2];{
C_word *av2=av;
av2[0]=t2;
av2[1]=((C_word*)t0)[3];
((C_proc)(void*)(*((C_word*)t2+1)))(2,av2);}}

/* k183 in k164 in loop in k158 in _file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_185(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(0,c,2)))){
C_save_and_reclaim((void *)f_185,c,av);}
C_trace(C_text("util/file-string.scm:38: loop"));
t2=((C_word*)((C_word*)t0)[2])[1];
f_162(t2,((C_word*)t0)[3],t1);}

/* file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_197(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2=av[2];
C_word t3;
C_word t4;
C_word t5;
C_word *a;
if(c!=3) C_bad_argc_2(c,3,t0);
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(8,c,2)))){
C_save_and_reclaim((void *)f_197,c,av);}
a=C_alloc(8);
t3=(*a=C_CLOSURE_TYPE|3,a[1]=(C_word)f_205,a[2]=t1,a[3]=t2,tmp=(C_word)a,a+=4,tmp);
t4=(*a=C_CLOSURE_TYPE|3,a[1]=(C_word)f_209,a[2]=t3,a[3]=t2,tmp=(C_word)a,a+=4,tmp);
C_trace(C_text("util/file-string.scm:44: _file->string"));
{C_proc tp=(C_proc)C_fast_retrieve_proc(*((C_word*)lf[1]+1));
C_word *av2=av;
av2[0]=*((C_word*)lf[1]+1);
av2[1]=t4;
av2[2]=t2;
tp(3,av2);}}

/* k203 in file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_205(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(0,c,3)))){
C_save_and_reclaim((void *)f_205,c,av);}
C_trace(C_text("util/file-string.scm:42: with-file-exists"));
{C_proc tp=(C_proc)C_fast_retrieve_symbol_proc(lf[10]);
C_word *av2;
if(c >= 4) {
  av2=av;
} else {
  av2=C_alloc(4);
}
av2[0]=*((C_word*)lf[10]+1);
av2[1]=((C_word*)t0)[2];
av2[2]=((C_word*)t0)[3];
av2[3]=t1;
tp(4,av2);}}

/* k207 in file->string in k152 in k149 in k146 in k143 in k140 in k137 */
static void C_ccall f_209(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word *a;
C_check_for_interrupt;
if(C_unlikely(!C_demand(C_calculate_demand(0,c,3)))){
C_save_and_reclaim((void *)f_209,c,av);}
C_trace(C_text("util/file-string.scm:43: with-file-readable"));
{C_proc tp=(C_proc)C_fast_retrieve_symbol_proc(lf[11]);
C_word *av2;
if(c >= 4) {
  av2=av;
} else {
  av2=C_alloc(4);
}
av2[0]=*((C_word*)lf[11]+1);
av2[1]=((C_word*)t0)[2];
av2[2]=((C_word*)t0)[3];
av2[3]=t1;
tp(4,av2);}}

/* toplevel */
static C_TLS int toplevel_initialized=0;

void C_ccall C_file_2dstring_toplevel(C_word c,C_word *av){
C_word tmp;
C_word t0=av[0];
C_word t1=av[1];
C_word t2;
C_word t3;
C_word *a;
if(toplevel_initialized) {C_kontinue(t1,C_SCHEME_UNDEFINED);}
else C_toplevel_entry(C_text("file-string"));
C_check_nursery_minimum(C_calculate_demand(3,c,2));
if(C_unlikely(!C_demand(C_calculate_demand(3,c,2)))){
C_save_and_reclaim((void*)C_file_2dstring_toplevel,c,av);}
toplevel_initialized=1;
if(C_unlikely(!C_demand_2(63))){
C_save(t1);
C_rereclaim2(63*sizeof(C_word),1);
t1=C_restore;}
a=C_alloc(3);
C_initialize_lf(lf,12);
lf[0]=C_h_intern(&lf[0],11, C_text("file-string"));
lf[1]=C_h_intern(&lf[1],13, C_text("_file->string"));
lf[2]=C_decode_literal(C_heaptop,C_text("\376B\000\000\000"));
lf[3]=C_decode_literal(C_heaptop,C_text("\376B\000\000\001\012"));
lf[4]=C_h_intern(&lf[4],23, C_text("scheme#close-input-port"));
lf[5]=C_h_intern(&lf[5],19, C_text("chicken.string#conc"));
lf[6]=C_h_intern(&lf[6],20, C_text("chicken.io#read-line"));
lf[7]=C_decode_literal(C_heaptop,C_text("\376B\000\000\000"));
lf[8]=C_h_intern(&lf[8],22, C_text("scheme#open-input-file"));
lf[9]=C_h_intern(&lf[9],12, C_text("file->string"));
lf[10]=C_h_intern(&lf[10],16, C_text("with-file-exists"));
lf[11]=C_h_intern(&lf[11],18, C_text("with-file-readable"));
C_register_lf2(lf,12,create_ptable());{}
t2=(*a=C_CLOSURE_TYPE|2,a[1]=(C_word)f_139,a[2]=t1,tmp=(C_word)a,a+=3,tmp);{
C_word *av2=av;
av2[0]=C_SCHEME_UNDEFINED;
av2[1]=t2;
C_library_toplevel(2,av2);}}

#ifdef C_ENABLE_PTABLES
static C_PTABLE_ENTRY ptable[17] = {
{C_text("f_139:util_2ffile_2dstring_2escm"),(void*)f_139},
{C_text("f_142:util_2ffile_2dstring_2escm"),(void*)f_142},
{C_text("f_145:util_2ffile_2dstring_2escm"),(void*)f_145},
{C_text("f_148:util_2ffile_2dstring_2escm"),(void*)f_148},
{C_text("f_151:util_2ffile_2dstring_2escm"),(void*)f_151},
{C_text("f_154:util_2ffile_2dstring_2escm"),(void*)f_154},
{C_text("f_156:util_2ffile_2dstring_2escm"),(void*)f_156},
{C_text("f_160:util_2ffile_2dstring_2escm"),(void*)f_160},
{C_text("f_162:util_2ffile_2dstring_2escm"),(void*)f_162},
{C_text("f_166:util_2ffile_2dstring_2escm"),(void*)f_166},
{C_text("f_178:util_2ffile_2dstring_2escm"),(void*)f_178},
{C_text("f_185:util_2ffile_2dstring_2escm"),(void*)f_185},
{C_text("f_197:util_2ffile_2dstring_2escm"),(void*)f_197},
{C_text("f_205:util_2ffile_2dstring_2escm"),(void*)f_205},
{C_text("f_209:util_2ffile_2dstring_2escm"),(void*)f_209},
{C_text("toplevel:util_2ffile_2dstring_2escm"),(void*)C_file_2dstring_toplevel},
{NULL,NULL}};
#endif

static C_PTABLE_ENTRY *create_ptable(void){
#ifdef C_ENABLE_PTABLES
return ptable;
#else
return NULL;
#endif
}

/*
o|safe globals: (file->string _file->string) 
o|replaced variables: 14 
o|removed binding forms: 11 
o|removed binding forms: 11 
o|simplifications: ((if . 1) (##core#call . 3)) 
o|  call simplifications:
o|    scheme#string-length
o|    scheme#=
o|    scheme#eof-object?
o|contracted procedure: k190 
o|contracted procedure: k186 
o|contracted procedure: k167 
o|contracted procedure: k173 
o|simplifications: ((let . 1)) 
o|removed binding forms: 4 
o|customizable procedures: (loop19) 
o|calls to known targets: 2 
o|fast box initializations: 1 
*/
/* end of file */
