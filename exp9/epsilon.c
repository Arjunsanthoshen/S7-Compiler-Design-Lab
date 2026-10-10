#include <stdio.h>
#include <string.h>

char result[20][20], states[20][20], copy[3];

void display(int n){
    int i;
    printf("\nEpsilon closure of %s = {", copy);

    for (i = 0; i < n; i++)
        printf(" %s", result[i]);

    printf(" }");
}

int main(){
    FILE *input = fopen("input.dat", "r");
    char state[3], state1[3], symbol[3], state2[3];
    int n, i, j;

    if (input == NULL){
        printf("input.dat not found!");
        return 1;
    }

    printf("Enter the no of states: ");
    scanf("%d", &n);

    printf("Enter the states: ");
    for (i = 0; i < n; i++)
        scanf("%s", states[i]);

    for (i = 0; i < n; i++){
        strcpy(state, states[i]);
        strcpy(copy, state);

        j = 0;
        strcpy(result[j++], state);

        while (fscanf(input, "%s%s%s", state1, symbol, state2) != EOF){
            if (strcmp(state, state1) == 0 && strcmp(symbol, "e") == 0){
                strcpy(result[j++], state2);
                strcpy(state, state2);
            }
        }
        display(j);
        rewind(input);
    }
    fclose(input);
    printf("\n");
    return 0;
}
