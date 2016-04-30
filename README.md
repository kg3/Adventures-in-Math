# Calculus
some pivotal moments in my journey through calculus where I needed Mathematica

# Linear Algebra
  (CS application: artificial intelligence) (MATLAB solution) A popular task in artificial intelligence is to classify things; popular choices are images and documents. Many methods for performing classification have been developed; for this we will use the SVD of a matrix.
The process is as follows:
(a) Training samples from each of c classes of objects are chosen, with each object represented as a vector in Rn where n is the number of attributes describing each object (for example, pixels for images).
(b) For each class, create an n × q matrix where q is the number of training samples for that class.
(c) Find the SVD of each of these training matrices.
(d) Given a test sample z (which needs to be represented as a column vector), for each class calculate
| | ( I − U k U kT ) z | | 2
where Uk is a matrix formed from the first k columns of the U matrix of a specific class
(these should correspond to the largest singular values).
(e) Classify z as belonging to the class whose norm produced the smallest value.
Problem: We have two classes of images: plus symbols and X symbols. We also have two test images that we wish to classify. How do we represent an image as a vector? The value of each pixel (i.e., picture element) in the image is stored as an element of a vector. If the image has dimensions p × q, then the vector will be a vector with pq elements. For this problem, each image has dimensions 3 × 3.
Use the following parameters:
(a) When creating a column vector of an image, the dark squares will have a value of 1 and the white squares will have a value of 0 in the vector.
(b) Use the first two columns of U, that is, k = 2.
Classify each test image. Print the norms used to classify. For example, I get the following
results:
         plus test image:
           norm Plus class = 1.00, norm X class = 2.18
           classify as Plus
         X test image:
           norm Plus class = 2.26, norm X class = 1.00
           classify as X
