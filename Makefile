#	Compiler
CPP = g++
#	Compiler Flags
FLAGS = -Wall -Werror
#	Name of the Server
EXECUTABLE = phoenix


SRCDIR = src
OBJDIR = obj

#	Sources
SRC = $(wildcard $(SRCDIR)/*.cpp)
#	Headers 
HDRS = $(wildcard $(SRCDIR)/*.hpp)
#	Creats Objects names
FILES := $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%)
#	Creats Objects names
OBJ := $(SRC:$(SRCDIR)/%.cpp=$(OBJDIR)/%.o)


# ${variable%pattern} is like $variable, minus shortest matching pattern from the back-end;
# ${variable##pattern} is like $variable, minus the longest matching pattern from front-end.

$(FILES):
	@mkdir -p $(OBJDIR)
	@for f in $(FILES) ;\
	do \
		$(CPP) $(FLAGS) -c $(SRCDIR)/$${f##*/}.cpp -o $(OBJDIR)/$${f##*/}.o ;\
	done

	
$(EXECUTABLE):
	@$(CPP) $(FLAGS) $(OBJ) -o $(EXECUTABLE)

info:
		@echo executable : $(EXECUTABLE)
		@echo source     : $(SRC)
		@echo headers    : $(HDRS)
		@echo objects    : $(OBJ)

run:
		@./$(EXECUTABLE)

clean:
		@rm	-rf	$(OBJDIR) $(EXECUTABLE) 
		@echo cleaned

# cat -e -t -v Makefile




# for further reading: https://stackoverflow.com/questions/25362847/cpp-to-o-files-in-makefile