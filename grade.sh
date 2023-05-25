CPATH='.:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests

#Checks if student code has correct file
if [ -f ./student-submission/ListExamples.java ] 
then   
    cp student-submission/*.java grading-area/
    cp -r lib grading-area
    cp -r TestListExamples.java grading-area
else 
    echo "Did not submit correct file"
    exit
fi


cd grading-area 

javac -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar *.java
java -cp .:lib/hamcrest-core-1.3.jar:lib/junit-4.13.2.jar org.junit.runner.JUnitCore TestListExamples