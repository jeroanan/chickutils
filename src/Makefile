BINDIR=./bin
OBJDIR=./obj

all: $(BINDIR)/cat $(BINDIR)/echo $(BINDIR)/false $(BINDIR)/head $(BINDIR)/hostid \
	$(BINDIR)/tac $(BINDIR)/tail $(BINDIR)/true 

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-util.o $(OBJDIR)/cat.o 

$(OBJDIR)/cat.o: cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c cat.scm

$(BINDIR)/false: false.scm
	chicken-csc -o $(BINDIR)/false false.scm

$(BINDIR)/echo: echo.scm
	chicken-csc -o $(BINDIR)/echo echo.scm

$(BINDIR)/head: $(OBJDIR)/head.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/head $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/head.o 

$(OBJDIR)/head.o: head.scm
	chicken-csc -o $(OBJDIR)/head.o -c head.scm

$(BINDIR)/hostid: hostid.scm
	chicken-csc -o $(BINDIR)/hostid hostid.scm

$(BINDIR)/tac: $(OBJDIR)/tac.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/tac $(OBJDIR)/file-util.o $(OBJDIR)/tac.o 

$(OBJDIR)/tac.o: tac.scm
	chicken-csc -o $(OBJDIR)/tac.o -c tac.scm

$(BINDIR)/tail: $(OBJDIR)/tail.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/tail $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/tail.o 

$(OBJDIR)/tail.o: tail.scm
	chicken-csc -o $(OBJDIR)/tail.o -c tail.scm
	
$(BINDIR)/true: true.scm
	chicken-csc -o $(BINDIR)/true true.scm
	
$(OBJDIR)/file-util.o: util/file-util.scm filesystem-macros.so
	chicken-csc -c util/file-util.scm -o $(OBJDIR)/file-util.o 

$(OBJDIR)/list-util.o: util/list-util.scm
	chicken-csc -c util/list-util.scm -o $(OBJDIR)/list-util.o 

filesystem-macros.so: util/filesystem-macros.scm
	chicken-csc -o filesystem-macros.so -s util/filesystem-macros.scm -j filesystem-macros

clean:
	rm -rf $(BINDIR) $(OBJDIR) *.so *.import.scm

$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
