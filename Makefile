CC=g++

FFLAGS = -O3
LFLAGS = -lgsl -lblas -lm
# May be needed instead of the above: LFLAGS = -lgsl -lgslcblas

CPPFILES = usefulfuncs.cpp cosmology.cpp MV.cpp MLE.cpp MV_bulkflow.cpp
OBJECTS = $(CPPFILES:.cpp=.o)

MV_bulkflow: $(OBJECTS)
	$(CC) -o MV_bulkflow $(OBJECTS) $(LFLAGS)

%.o: %.cpp
	$(CC) $(FFLAGS) -c $(CPPFILES)

clean:
	rm -rdf *.o MV_bulkflow
