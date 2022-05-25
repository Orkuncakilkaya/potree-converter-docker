# Potree Converter docker

## Instructions
- Build the image (only first time) `docker build -t potreeconverter .`
- Copy a LAS file into `/input`
- Customize and launch this command and start the conversion `docker run -v $PWD/input:/input -v $PWD/output:/output potreeconverter ./PotreeConverter /input/ExampleFile.las -p ExampleFile -o /output/ExampleFile`