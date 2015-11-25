
#include <stdio.h>
#include<time.h>
#include "ppmlib.h"

int leftX,rightX,topY,bottomY;
void changeGray(int n2,int x,int y){
    int col;
    float r, g, b, gl;
    
    r = image[n2][x][y][0];
    g = image[n2][x][y][1];
    b = image[n2][x][y][2];
    
    gl = 0.3*r + 0.59*g + 0.11*b;
    for(col=0;col<3;col++) image[n2][x][y][col]=gl;
}
int inside(int n2,int x,int y){
    //0:ライン内　1:ライン外
    if((leftX <= x && x <= rightX) && (topY <= y && y <= bottomY))return 0;
    else return 1;

}
int main(void){
    load_color_image(0,"");
    copy_color_image(0,1);
    
    printf("TopY:"); scanf("%d",&topY);
    printf("BottomY:"); scanf("%d",&bottomY);
    printf("LeftX:"); scanf("%d",&leftX);
    printf("RightX:"); scanf("%d",&rightX);
    
    int x,y;
    int in;
    
    for(y=0;y<height[1];y++){
        for(x=0;x<width[1];x++){
            int in = inside(1,x,y);
            //枠外
            if(in==1) changeGray(1,x,y);
        }
    }
    save_color_image(1,"");
}
