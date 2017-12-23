JFLAGS = -g
JC = javac
JRUN = java
LIB = lib/algs4.jar
CLASSES = \
	src/seam/SeamCarver.java \
	src/seam/PrintSeams.java \
	src/seam/ShowEnergy.java \
	src/seam/ShowSeams.java \
	src/seam/ResizeDemo.java \

.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) -d bin -cp $(LIB):src/seam $*.java

default: classes

classes: $(CLASSES:.java=.class)

run: classes
	# $(JRUN) -cp bin:$(LIB) SeamCarver
	# $(JRUN) -cp bin:$(LIB) ShowEnergy input/seam/chameleon.png
	$(JRUN) -cp bin:$(LIB) PrintSeams input/seam/1x8.png
	# $(JRUN) -cp bin:$(LIB) ShowSeams input/seam/chameleon.png
	# $(JRUN) -cp bin:$(LIB) ResizeDemo input/seam/chameleon.png 200 100
	# $(JRUN) -cp bin:$(LIB) ResizeDemo input/seam/HJocean.png 200 100

zip:
	cp src/seam/SeamCarver.java ./
	zip -r seam.zip *.java
	$(RM) *.java

clean:
	$(RM) bin/*.class