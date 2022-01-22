BINDIR=./bin
BUILDDIR=./build
OBJDIR=./obj
SRCDIR=./src

all: builddir $(BINDIR)/cat $(BINDIR)/echo $(BINDIR)/false $(BINDIR)/head $(BINDIR)/hostid \
	$(BINDIR)/hostname $(BINDIR)/logname $(BINDIR)/tac $(BINDIR)/tail $(BINDIR)/true \
	$(BINDIR)/whoami

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-util.o $(OBJDIR)/cat.o 

$(OBJDIR)/cat.o: $(BUILDDIR)/cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c $(BUILDDIR)/cat.scm

$(BINDIR)/false: $(BUILDDIR)/false.scm
	chicken-csc -o $(BINDIR)/false $(BUILDDIR)/false.scm

$(BINDIR)/echo: $(BUILDDIR)/echo.scm
	chicken-csc -o $(BINDIR)/echo $(BUILDDIR)/echo.scm

$(BINDIR)/head: $(OBJDIR)/head.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/head $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/head.o 

$(OBJDIR)/head.o: $(BUILDDIR)/head.scm
	chicken-csc -o $(OBJDIR)/head.o -c $(BUILDDIR)/head.scm

$(BINDIR)/hostid: $(BUILDDIR)/hostid.scm
	chicken-csc -o $(BINDIR)/hostid $(BUILDDIR)/hostid.scm

$(BINDIR)/hostname: $(BUILDDIR)/hostname.scm
	chicken-csc -o $(BINDIR)/hostname $(BUILDDIR)/hostname.scm

$(BINDIR)/logname: $(BUILDDIR)/logname.scm
	chicken-csc -o $(BINDIR)/logname $(BUILDDIR)/logname.scm

$(BINDIR)/tac: $(OBJDIR)/tac.o $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/tac $(OBJDIR)/file-util.o $(OBJDIR)/tac.o 

$(OBJDIR)/tac.o: $(BUILDDIR)/tac.scm
	chicken-csc -o $(OBJDIR)/tac.o -c $(BUILDDIR)/tac.scm

$(BINDIR)/tail: $(OBJDIR)/tail.o $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/tail $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/tail.o 

$(OBJDIR)/tail.o: $(BUILDDIR)/tail.scm
	chicken-csc -o $(OBJDIR)/tail.o -c $(BUILDDIR)/tail.scm
	
$(BINDIR)/true: $(BUILDDIR)/true.scm
	chicken-csc -o $(BINDIR)/true $(BUILDDIR)/true.scm

$(BINDIR)/whoami: $(BUILDDIR)/whoami.scm
	chicken-csc -o $(BINDIR)/whoami $(BUILDDIR)/whoami.scm
	
$(OBJDIR)/file-util.o: $(BUILDDIR)/util/file-util.scm 
	pushd $(BUILDDIR)/util; \
	m4 file-util.scm > file-util.tmp.scm; \
	mv file-util.tmp.scm file-util.scm; \
	popd; \
	chicken-csc -c $(BUILDDIR)/util/file-util.scm -o $(OBJDIR)/file-util.o 

$(OBJDIR)/list-util.o: $(BUILDDIR)/util/list-util.scm
	chicken-csc -c $(BUILDDIR)/util/list-util.scm -o $(OBJDIR)/list-util.o 

filesystem-macros.so: $(BUILDDIR)/util/filesystem-macros.scm
	chicken-csc -o filesystem-macros.so -s $(BUILDDIR)/util/filesystem-macros.scm -j filesystem-macros

builddir:
	cp -r $(SRCDIR) $(BUILDDIR)

clean:
	rm -rf $(BINDIR) $(OBJDIR) $(BUILDDIR) *.so *.import.scm

$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
