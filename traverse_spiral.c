////////////////////////////////////////////////////////////////////////////////
// Main File:        traverse_spiral.c
// This File:        traverse_spiral.c
// Other Files:      (name of all other files if any)
// Semester:         CS 354 Spring 2019
//
// Author:           Shihan Cheng
// Email:            scheng93@wisc.edu
// CS Login:         shihan
//         
/////////////////////////// OTHER SOURCES OF HELP //////////////////////////////
//                   fully acknowledge and credit all sources of help,
//                   other than Instructors and TAs.
//
// Persons:          Identify persons by name, relationship to you, and email.
//                   Describe in detail the the ideas and help they provided.
//
// Online sources:   avoid web searches to solve your problems, but if you do
//                   search, be sure to include Web URLs and description of 
//                   of any information you find.
////////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char *COMMA = ","; 

// Structure representing Matrix
// size: Dimension of the square (size*size)
// array: 2D array of integers
typedef struct _Square { 
    int size;
    int **array;
} Square; 

/* TODO:
 * Retrieves from the first line of the input file,
 * the size of the square matrix.
 * 
 * fp: file pointer for input file
 * size: pointer to size of the square matrix
 */
void get_dimensions(FILE *fp, int *size) {   
    char *first_line = NULL;
    size_t len = 0;
    if (getline(&first_line, &len, fp) == -1) {
        printf("Error while reading the file\n");
        exit(1);
    }
    *size = atoi(first_line);
}

/* PARTIALLY COMPLETED:
 * Traverses a given layer from the square matrix
 * 
 * array: Heap allocated 2D square matrix
 * size: size of the 2D square matrix
 * layer: layer number to be traversed
 * op: pointer to the output file
 */
void traverse_layer(int **array, int size, int layer, FILE *op) {  
	int row_num, col_num;
    int i;
	
	//corner case: size is odd & the layer is last so only one entry to print
        if(size % 2 == 1 && layer == (size + 1) / 2 - 1){
                fprintf(op, "%d\n", *(*(array + layer) + layer));
                return;
        }

	//Traverse upper row from left to right with appropriate bounds
    // In this loop, size - layer*2 means how many elements the function
    // shoule check in the upper row. Due to we have corner case, that we
    // do not need to check if the size <= layer*2
	row_num = layer;
    for(i = 0; i < (size - layer * 2); i++) {
        fprintf(op, "%d ", *(*(array + row_num) + row_num + i));
	}

	//Traverse right column from top to bottom with appropriate bounds
    // In this loop, size - layer*2 - 1 means how many elements for the
    // fucntion. Every time the layer traces, the elements should be
    // 2*layer - 1 less than the size. Array + layer + i + 1 means the
    // first element that should be trace.
	col_num = size-layer-1;
    for(i = 0; i < (size - layer * 2 - 1); i++) {
        fprintf(op, "%d ", *(*(array + layer + i + 1) + col_num));
	}

	//Traverse lower row from right to left with appropriate bounds
    // In this loop, size - layer*2 - 1 means how many elements for the
    // fucntion. Every time the layer traces, the elements should be
    // 2*layer - 1 less than the size as above. The very first element
    // that should be traced is index of size - layer * 2 - 2
	row_num = size-layer-1;
    for(i = (size - layer * 2 - 1); i > 0; i--) {
        fprintf(op, "%d ", *(*(array + col_num) + i - 1));
		
	}

	//Traverse left column from bottom to top with appropriate bounds
    // In this loop, size - layer*2 - 2 means how many elements for the
    // fucntion. Every time the layer traces, the elements should be
    // 2*layer - 2 less than the size. The very first element
    // that should be traced is index of size - 2
	col_num = layer;
    for(i = 0; i < (size - layer * 2 - 2); i++) {
        fprintf(op, "%d ", *(*(array + size - 2 - i) + col_num));
	}
}


/* COMPLETED:
 * Traverses the square matrix spirally
 * 
 * square: pointer to a structure that contains 2D square matrix
 * op: pointer to the output file
 */
void traverse_spirally(Square *square, FILE *op) {         
	int size = square->size; 
	int num_layers = 0;   
	num_layers = size/2; 
	if(size%2 == 1) {
		num_layers++;
	}
	 
	int i;
	for(i = 0; i < num_layers; i++) {
		traverse_layer(square->array, size, i, op);
	}
}

/* PARTIALLY COMPLETED:
 * This program reads a square matrix from the input file
 * and outputs its spiral order traversal to the output file
 *
 * argc: CLA count
 * argv: CLA value
 */
  
int main(int argc, char *argv[]) {
    // Check the if command-line arg is 3
    if (argc != 3) {
        printf("Usage: ./traverse_spiral <input_filename> <output_filename>\n");
        
    }

	//Open the file and check if it opened successfully
    FILE *ifp, *ofp; // File pointers
    ifp = fopen(argv[1], "r");
    if (ifp == NULL) {
        // If file opened unsuccessfully, prompt warning
        fprintf(stderr, "Cannot open file for reading.");
        exit(1);
    }

	//Call the function get_dimensions to retrieve size of the square matrix
    int dimen = 0; // For storing the demensions
    get_dimensions(ifp, &dimen); // Call the function
    

	//Dynamically allocate a 2D array as per the retrieved dimensions
    int **store_array;
    store_array = malloc(sizeof(int*) * dimen);
    for (int i = 0; i < dimen; i++) {
        *(store_array + i) = malloc(sizeof(int) * dimen);
    }


	//Read the file line by line by using the function getline as used in get_dimensions
	//Tokenize each line wrt comma to store the values in the square matrix
    // Declaration
    char *line = NULL;
    size_t len = 0;
    char *token = NULL;
    for (int i = 0; i < dimen; i++) {
        if (getline(&line, &len, ifp) == -1) {
            printf("Error while reading the file\n");
            exit(1);
        }
        // Seperate them with line and comma
        token = strtok(line, COMMA);
        // Store the numbers to the square array
        for (int j = 0; j < dimen; j++) {
            *(*(store_array + i) + j) = atoi(token);
            token = strtok(NULL, COMMA);
        }
    }


	//Create a structure and initialize its size and array fields appropriately
    Square *sq = malloc(sizeof(Square));
    sq -> size = dimen; // size is the value of dimen
    sq -> array = store_array; // Points to the array storing numbers above


	//Open the output file
    ofp = fopen(argv[2], "w");
    if (ofp == NULL) {
        // If file opened unsuccessfully, prompt warning
        fprintf(stderr, "Cannot open file for reading.");
        exit(1);
    }


	//Call the function traverse_spirally
    traverse_spirally(sq, ofp);

	//Free the dynamically allocated memory
    for (int j = 0; j < dimen; j++) {
        free(store_array[j]);
    }
    free(store_array);
	//Close the input file
    fclose(ifp);
	//Close the output file
    fclose(ofp);
	return 0; 
}         

