## Calculus
some pivotal moments in my journey through calculus where I needed Mathematica

## Linear Algebra
  (CS application: artificial intelligence) 
  A popular task in artificial intelligence is to classify things; popular choices are images and documents. Many methods for performing classification have been developed; for this we will use the SVD of a matrix.
1. The process is as follows:
  1. Training samples from each of c classes of objects are chosen, with each object represented as a vector in Rn where n is the number of attributes describing each object (for example, pixels for images).
  2. For each class, create an n × q matrix where q is the number of training samples for that class.
  3. Find the SVD of each of these training matrices.
  4. Given a test sample z (which needs to be represented as a column vector), for each class calculate ||( I − U k U kT ) z ||2 where Uk is a matrix formed from the first k columns of the U matrix of a specific class (these should correspond to the largest singular values).
  5. Classify z as belonging to the class whose norm produced the smallest value.

2. Problem: 
  1. We have two classes of images: plus symbols and X symbols. We also have two test images that we wish to classify. How do we represent an image as a vector? The value of each pixel (i.e., picture element) in the image is stored as an element of a vector. If the image has dimensions p × q, then the vector will be a vector with pq elements. For this problem, each image has dimensions 3 × 3.
  2. Use the following parameters:
    1. When creating a column vector of an image, the dark squares will have a value of 1 and the white squares will have a value of 0 in the vector.
    2. Use the first two columns of U, that is, k = 2.
    3. Classify each test image. Print the norms used to classify. 
