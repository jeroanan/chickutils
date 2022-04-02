BINDIR=./bin
BUILDDIR=./build
OBJDIR=./obj
SRCDIR=./src

all: builddir $(BINDIR)/basename $(BINDIR)/cat $(BINDIR)/echo $(BINDIR)/false $(BINDIR)/groups \
	$(BINDIR)/head $(BINDIR)/hostid $(BINDIR)/hostname $(BINDIR)/id $(BINDIR)/logname $(BINDIR)/nl \
	$(BINDIR)/tac $(BINDIR)/tail $(BINDIR)/true $(BINDIR)/whoami

$(BINDIR)/basename: $(SRCDIR)/basename.scm $(OBJDIR)/cmdline-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/basename $(SRCDIR)/basename $(OBJDIR)/cmdline-util.o $(OBJDIR)/list-util.o

$(BINDIR)/cat: $(SRCDIR)/cat.scm $(OBJDIR)/file-util.o $(OBJDIR)/cmdline-util.o
	chicken-csc -o $(BINDIR)/cat $(BUILDDIR)/cat.scm \
		$(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/cmdline-util.o

$(BINDIR)/false: $(SRCDIR)/false.scm
	chicken-csc -o $(BINDIR)/false $(BUILDDIR)/false.scm

$(BINDIR)/echo: $(SRCDIR)/echo.scm $(OBJDIR)/cmdline-util.o
	chicken-csc -o $(BINDIR)/echo $(BUILDDIR)/echo.scm $(OBJDIR)/cmdline-util.o $(OBJDIR)/list-util.o

$(BINDIR)/groups: $(SRCDIR)/groups.scm $(OBJDIR)/grp.o
	chicken-csc -o $(BINDIR)/groups $(BUILDDIR)/groups.scm $(OBJDIR)/grp.o

$(BINDIR)/head: $(SRCDIR)/head.scm $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(OBJDIR)/cmdline-util.o
	chicken-csc -o $(BINDIR)/head $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(BUILDDIR)/head.scm \
		$(OBJDIR)/cmdline-util.o

$(BINDIR)/hostid: $(SRCDIR)/hostid.scm $(OBJDIR)/unistd.o
	chicken-csc -o $(BINDIR)/hostid $(BUILDDIR)/hostid.scm $(OBJDIR)/unistd.o

$(BINDIR)/hostname: $(SRCDIR)/hostname.scm $(OBJDIR)/unistd.o
	chicken-csc -o $(BINDIR)/hostname $(BUILDDIR)/hostname.scm $(OBJDIR)/unistd.o

$(BINDIR)/id: $(SRCDIR)/id.scm $(OBJDIR)/unistd.o $(OBJDIR)/grp.o
	chicken-csc -o $(BINDIR)/id $(BUILDDIR)/id.scm $(OBJDIR)/unistd.o $(OBJDIR)/grp.o

$(BINDIR)/nl: $(SRCDIR)/nl.scm $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/nl $(OBJDIR)/file-util.o $(BUILDDIR)/nl.scm $(OBJDIR)/list-util.o

$(BINDIR)/logname: $(SRCDIR)/logname.scm $(OBJDIR)/unistd.o
	chicken-csc -o $(BINDIR)/logname $(BUILDDIR)/logname.scm $(OBJDIR)/unistd.o

$(BINDIR)/tac: $(SRCDIR)/tac.scm $(OBJDIR)/file-util.o 
	chicken-csc -o $(BINDIR)/tac $(OBJDIR)/file-util.o $(BUILDDIR)/tac.scm 

$(BINDIR)/tail: $(SRCDIR)/tail.scm $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o
	chicken-csc -o $(BINDIR)/tail $(OBJDIR)/file-util.o $(OBJDIR)/list-util.o $(BUILDDIR)/tail.scm

$(BINDIR)/true: $(SRCDIR)/true.scm
	chicken-csc -o $(BINDIR)/true $(BUILDDIR)/true.scm

$(BINDIR)/whoami: $(SRCDIR)/whoami.scm $(OBJDIR)/unistd.o
	chicken-csc -o $(BINDIR)/whoami $(BUILDDIR)/whoami.scm  $(OBJDIR)/unistd.o
	
$(OBJDIR)/file-util.o: $(SRCDIR)/util/file-util.scm 
	pushd $(BUILDDIR)/util; \
	m4 file-util.scm > file-util.tmp.scm; \
	mv file-util.tmp.scm file-util.scm; \
	popd; \
	chicken-csc -c $(BUILDDIR)/util/file-util.scm -o $(OBJDIR)/file-util.o 

$(OBJDIR)/grp.o: $(SRCDIR)/util/grp.scm
	chicken-csc -c $(BUILDDIR)/util/grp.scm -o $(OBJDIR)/grp.o 

$(OBJDIR)/unistd.o: $(SRCDIR)/util/unistd.scm
	chicken-csc -c $(BUILDDIR)/util/unistd.scm -o $(OBJDIR)/unistd.o 

$(OBJDIR)/cmdline-util.o: $(SRCDIR)/util/cmdline-util.scm $(OBJDIR)/list-util.o
	chicken-csc -c $(BUILDDIR)/util/cmdline-util.scm $(OBJDIR)/list-util.o -o $(OBJDIR)/cmdline-util.o

$(OBJDIR)/list-util.o: $(SRCDIR)/util/list-util.scm
	chicken-csc -c $(BUILDDIR)/util/list-util.scm -o $(OBJDIR)/list-util.o 

builddir:
	rm -rf $(BUILDDIR); cp -r $(SRCDIR) $(BUILDDIR)

clean:
	rm -rf $(BINDIR) $(OBJDIR) $(BUILDDIR) *.so *.import.scm

$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
