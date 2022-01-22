BINDIR=./bin
OBJDIR=./obj
SRCDIR=./src

all: $(BINDIR)/cat $(BINDIR)/echo $(BINDIR)/false $(BINDIR)/head $(BINDIR)/hostid \
	$(BINDIR)/hostname $(BINDIR)/logname $(BINDIR)/tac $(BINDIR)/tail $(BINDIR)/true \
	$(BINDIR)/whoami

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-util.o $(OBJDIR)/cat.o 

$(OBJDIR)/cat.o: $(SRCDIR)/cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c $(SRCDIR)/cat.scm

$(BINDIR)/false: $(SRCDIR)/false.scm
	chicken-csc -o $(BINDIR)/false $(SRCDIR)/false.scm

$(BINDIR)/echo: $(SRCDIR)/echo.scm
	chicken-csc -o $(BINDIR)/echo $(SRCDIR)/echo.scm

$(BINDIR)/head: $(OBJDIR)/head.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/head $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/head.o 

$(OBJDIR)/head.o: $(SRCDIR)/head.scm
	chicken-csc -o $(OBJDIR)/head.o -c $(SRCDIR)/head.scm

$(BINDIR)/hostid: $(SRCDIR)/hostid.scm
	chicken-csc -o $(BINDIR)/hostid $(SRCDIR)/hostid.scm

$(BINDIR)/hostname: $(SRCDIR)/hostname.scm
	chicken-csc -o $(BINDIR)/hostname $(SRCDIR)/hostname.scm

$(BINDIR)/logname: $(SRCDIR)/logname.scm
	chicken-csc -o $(BINDIR)/logname $(SRCDIR)/logname.scm

$(BINDIR)/tac: $(OBJDIR)/tac.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/tac $(OBJDIR)/file-util.o $(OBJDIR)/tac.o 

$(OBJDIR)/tac.o: $(SRCDIR)/tac.scm
	chicken-csc -o $(OBJDIR)/tac.o -c $(SRCDIR)/tac.scm

$(BINDIR)/tail: $(OBJDIR)/tail.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/tail $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/tail.o 

$(OBJDIR)/tail.o: $(SRCDIR)/tail.scm
	chicken-csc -o $(OBJDIR)/tail.o -c $(SRCDIR)/tail.scm
	
$(BINDIR)/true: $(SRCDIR)/true.scm
	chicken-csc -o $(BINDIR)/true $(SRCDIR)/true.scm

$(BINDIR)/whoami: $(SRCDIR)/whoami.scm
	chicken-csc -o $(BINDIR)/whoami $(SRCDIR)/whoami.scm
	
$(OBJDIR)/file-util.o: $(SRCDIR)/util/file-util.scm filesystem-macros.so
	chicken-csc -c $(SRCDIR)/util/file-util.scm -o $(OBJDIR)/file-util.o 

$(OBJDIR)/list-util.o: $(SRCDIR)/util/list-util.scm
	chicken-csc -c $(SRCDIR)/util/list-util.scm -o $(OBJDIR)/list-util.o 

filesystem-macros.so: $(SRCDIR)/util/filesystem-macros.scm
	chicken-csc -o filesystem-macros.so -s $(SRCDIR)/util/filesystem-macros.scm -j filesystem-macros

clean:
	rm -rf $(BINDIR) $(OBJDIR) *.so *.import.scm

$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
