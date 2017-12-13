
void setup(){
size(500,500);

background(#151B54);
}




void draw(){

fill(#FDD017);
noStroke();
triangle(100,100,300,100,200,300);

fill(#0C090A);
arc(200,300,100,100,0,PI);

bezier(15,15,90,90,45,45,30,30);

fill(#E5E4E2);
ellipse(200,90,100,100);

fill(120);
noStroke();
ellipse(200,90,50,50);

fill(#FF0000);
triangle(200,80,60,60,10,10);


}