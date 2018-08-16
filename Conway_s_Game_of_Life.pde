int s=10;

int a[][]=new int[s][s];
int ta[][]=new int[s][s];

void setup() {
  size(800,800);
  frameRate(1);
  for(int x=0; x<s; x++) {
    for(int y=0; y<s; y++) {
      a[x][y]=0;
    }
  }
  ta=a;
  dp(0,5,5);
}

void draw() {
  background(255);
  for(int x=0; x<s; x++) {
    for(int y=0; y<s; y++) {
      if(a[x][y]==0) {
        fill(0);
      }
      else {
        fill(255);
      }
      rect(x*(width/s),y*(width/s),width/s,width/s);  
    }    
  }
  generate();
  a=ta;
}

void generate() {
  for(int x=1; x<s-1; x++) {
    for(int y=1; y<s-1; y++) {
      
      for(int q=-1; x<1; x++) {
        for(int w=-1; y<1; y++) {
          ta[x][y]+=a[q][w];  
        }
      }
      ta[x][y]-=a[x][y];
    }
  }   
}

void dp(int n,int x,int y) {
  switch(n) {
    case 0:
      a[x][y]=1;
      a[x+1][y]=1;
      a[x-1][y]=1;
    break;
  }
}