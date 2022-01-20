BINDIR=./bin
OBJDIR=./obj

all: $(BINDIR)/cat $(BINDIR)/echo $(BINDIR)/false $(BINDIR)/tac $(BINDIR)/true

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-string.o 
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-string.o $(OBJDIR)/cat.o 

$(OBJDIR)/cat.o: cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c cat.scm

$(BINDIR)/false: false.scm
	chicken-csc -o $(BINDIR)/false false.scm

$(BINDIR)/echo: echo.scm
	chicken-csc -o $(BINDIR)/echo echo.scm

$(OBJDIR)/file-string.o: util/file-string.scm filesystem-macros.so
	chicken-csc -c util/file-string.scm -o $(OBJDIR)/file-string.o 

$(BINDIR)/tac: $(OBJDIR)/tac.o $(OBJDIR)/file-string.o 
	chicken-csc -o $(BINDIR)/tac $(OBJDIR)/file-string.o $(OBJDIR)/tac.o 

$(OBJDIR)/tac.o: tac.scm
	chicken-csc -o $(OBJDIR)/tac.o -c tac.scm
	
$(BINDIR)/true: true.scm
	chicken-csc -o $(BINDIR)/true true.scm
	
filesystem-macros.so: util/filesystem-macros.scm
	chicken-csc -o filesystem-macros.so -s util/filesystem-macros.scm -j filesystem-macros

clean:
	rm -rf $(BINDIR) $(OBJDIR) *.so

$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
