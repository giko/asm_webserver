#
# Microsoft makefile
# Use with nmake
#

.SUFFIXES:
.SUFFIXES: .obj .asm .cpp .c

AS=nasm
ASFLAGS= -f win32
CFLAGS=
CC=cl
CXX=cl
CXXFLAGS=-GX

.asm.obj:
	$(AS) $(ASFLAGS) $*.asm

.cpp.obj:
	$(CXX) -c $(CXXFLAGS) $*.cpp

.c.obj:
	$(CC) -c $(CFLAGS) $*.c

all: first.exe asm_io.obj first.obj driver.obj

first.exe : driver.obj first.obj asm_io.obj
	$(CC) $(CFLAGS) -Fefirst.exe driver.obj first.obj asm_io.obj

asm_io.obj : asm_io.asm
	$(AS) $(ASFLAGS) -d COFF_TYPE asm_io.asm
	
first.obj : asm_io.inc first.asm

driver.obj : driver.c


clean :
	del *.obj
	del *.exe