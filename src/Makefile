BINDIR=./bin
OBJDIR=./obj

$(BINDIR)/cat: $(OBJDIR)/cat.o $(OBJDIR)/file-string.o
	chicken-csc -o $(BINDIR)/cat $(OBJDIR)/file-string.o $(OBJDIR)/cat.o

$(OBJDIR)/cat.o: cat.scm
	chicken-csc -o $(OBJDIR)/cat.o -c cat.scm

$(OBJDIR)/file-string.o: file-string.scm
	chicken-csc -o $(OBJDIR)/file-string.o -c file-string.scm

clean:
	rm -rf $(BINDIR) $(OBJDIR)

all: cat


$(shell mkdir -p $(BINDIR))
$(shell mkdir -p $(OBJDIR))
