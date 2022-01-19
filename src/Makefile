BINDIR=./bin
OBJDIR=./obj

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-utils.o 
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-utils.o $(OBJDIR)/cat.o 

$(OBJDIR)/cat.o: cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c cat.scm

$(OBJDIR)/file-utils.o: util/file-utils.scm 
	chicken-csc -o $(OBJDIR)/file-utils.o -c util/file-utils.scm 

clean:
	rm -rf $(BINDIR) $(OBJDIR)

all: cat


$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
